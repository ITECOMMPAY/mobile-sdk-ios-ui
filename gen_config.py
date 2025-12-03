#!/usr/bin/env python3
"""
Local configuration generator for iOS project with renaming functionality

This script replicates the behavior of the CI system to generate
configuration files locally on the developer's machine.
It also supports renaming functionality for refactoring projects.

Usage:
    python generate_config.py --api-url https://sdk.api.example.com --environment production
    python generate_config.py --config config.json
    python generate_config.py --rename-config rename_config.json
"""

import argparse
import json
import os
import sys
import hashlib
import subprocess
import re
import shutil
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, Any, Optional, List, Tuple
from dataclasses import dataclass, asdict
from enum import Enum


default_output_dir = "mobileSDK.Facade/mobileSDK.Facade/Sources/Generated"
original_name = "ecommpay"


@dataclass
class BuildConfig:
    """
    Class for storing build configuration
    
    """
    api_host: str
    socket_host: str


@dataclass
class RenameConfig:
    from_name: str
    merchant_name: str
    project_root: str = "."
    exclude_dirs: List[str] = None
    exclude_files: List[str] = None
    file_extensions: List[str] = None
    files_without_extension: List[str] = None
    case_sensitive: bool = False
    dry_run: bool = False
    
    def __post_init__(self):
        if self.exclude_dirs is None:
            self.exclude_dirs = ['.git', '.build', 'node_modules', '.idea', '.vscode']
        if self.exclude_files is None:
            self.exclude_files = ['.DS_Store', '.gitignore', 'rename_config.json']
        if self.file_extensions is None:
            self.file_extensions = ['.swift', '.h', '.m', '.mm', '.cpp', '.c', '.json', '.plist', '.md', '.txt', '.yml', '.yaml', '.xml', '.podspec', '.pbxproj', '.xcscheme', '.entitlements']
        if self.files_without_extension is None:
            self.files_without_extension = ['Podfile', 'Fastfile']


class TextTransformer:
    """Utility class for text case transformations"""
    
    @staticmethod
    def to_pascal_case(text: str) -> str:
        """Convert to PascalCase (first letter uppercase)"""
        if not text:
            return text
        return text[0].upper() + text[1:]
    
    @staticmethod
    def to_camel_case(text: str) -> str:
        if not text:
            return text
        return text[0].lower() + text[1:]
    
    @staticmethod
    def to_upper_case(text: str) -> str:
        return text.upper()
    
    @staticmethod
    def to_lower_case(text: str) -> str:
        return text.lower()
    
    @staticmethod
    def to_snake_case(text: str) -> str:
        s1 = re.sub('([a-z0-9])([A-Z])', r'\1_\2', text)
        return s1.lower()
    
    @staticmethod
    def to_kebab_case(text: str) -> str:
        s1 = re.sub('([a-z0-9])([A-Z])', r'\1-\2', text)
        return s1.lower()
    
    @classmethod
    def generate_all_variants(cls, text: str) -> Dict[str, str]:
        return {
            'original': text,
            'pascal': cls.to_pascal_case(text),
            'camel': cls.to_camel_case(text),
            'upper': cls.to_upper_case(text),
            'lower': cls.to_lower_case(text),
            'snake': cls.to_snake_case(text),
            'kebab': cls.to_kebab_case(text)
        }


class ProjectRenamer:
    
    def __init__(self, config: RenameConfig):
        self.config = config
        self.project_root = Path(config.project_root).resolve()
        
        # Generate all case variants
        self.from_variants = TextTransformer.generate_all_variants(config.from_name)
        self.to_variants = TextTransformer.generate_all_variants(config.merchant_name)
        
        # Statistics
        self.renamed_files = 0
        self.renamed_folders = 0
        self.modified_files = 0
        self.total_replacements = 0
        
        print(f"   From: {original_name}")
        print(f"   To: {config.merchant_name}")
        print(f"   Case sensitive: {config.case_sensitive}")
        print(f"   Dry run: {config.dry_run}")
        print(f"   Project root: {self.project_root}")
        
        # Show file processing info
        print(f"\nFile processing configuration:")
        if self.config.file_extensions:
            print(f"   Extensions: {', '.join(self.config.file_extensions)}")
        if self.config.files_without_extension:
            print(f"   Files without ext: {', '.join(self.config.files_without_extension)}")
        
        # Show all variants that will be processed
        print(f"\n Case variants to be processed:")
        for variant_name, (from_val, to_val) in zip(
            self.from_variants.keys(),
            zip(self.from_variants.values(), self.to_variants.values())
        ):
            if from_val != to_val:
                print(f"   {variant_name:8}: {from_val} → {to_val}")
    
    def rename_all(self) -> None:
        if self.config.dry_run:
            print("\n Starting dry run (no actual changes will be made)...")
        else:
            print("\n Starting rename operation...")
        
        try:
            self._rename_content()
            self._rename_files()
            self._rename_folders()
            self._print_summary()
            
        except Exception as e:
            print(f"\n Error during rename operation: {e}")
            sys.exit(1)
    
    def _rename_content(self) -> None:
        """Rename content inside files"""
        if self.config.dry_run:
            print("   → [DRY RUN] Analyzing content in files...")
        else:
            print("   → Renaming content in files...")
        
        for file_path in self._get_files_to_process():
            if self._should_process_file(file_path):
                try:
                    self._rename_file_content(file_path)
                except Exception as e:
                    print(f"        Warning: Failed to process {file_path}: {e}")
    
    def _rename_files(self) -> None:
        if self.config.dry_run:
            print("   → [DRY RUN] Analyzing files to rename...")
        else:
            print("   → Renaming files...")

        files_to_rename = []
        
        for file_path in self._get_files_to_process():
            new_name = self._get_renamed_filename(file_path.name)
            if new_name != file_path.name:
                files_to_rename.append((file_path, new_name))
        
        # Sort by depth (deepest first) to avoid path issues
        files_to_rename.sort(key=lambda x: len(x[0].parts), reverse=True)
        
        for file_path, new_name in files_to_rename:
            try:
                if self.config.dry_run:
                    print(f"      [DRY RUN] Would rename: {file_path.name} → {new_name}")
                else:
                    new_path = file_path.parent / new_name
                    file_path.rename(new_path)
                    print(f"       {file_path.name} → {new_name}")
                self.renamed_files += 1
            except Exception as e:
                print(f"        Warning: Failed to rename {file_path}: {e}")
    
    def _rename_folders(self) -> None:
        """Rename folders"""
        if self.config.dry_run:
            print("   → [DRY RUN] Analyzing folders to rename...")
        else:
            print("   → Renaming folders...")
        
        # Get all directories that need renaming
        dirs_to_rename = []
        
        for dir_path in self._get_directories_to_process():
            new_name = self._get_renamed_filename(dir_path.name)
            if new_name != dir_path.name:
                dirs_to_rename.append((dir_path, new_name))
        
        # Sort by depth (deepest first) to avoid path issues
        dirs_to_rename.sort(key=lambda x: len(x[0].parts), reverse=True)
        
        for dir_path, new_name in dirs_to_rename:
            try:
                if self.config.dry_run:
                    print(f"      [DRY RUN] Would rename: {dir_path.name}/ → {new_name}/")
                else:
                    new_path = dir_path.parent / new_name
                    dir_path.rename(new_path)
                    print(f"       {dir_path.name}/ → {new_name}/")
                self.renamed_folders += 1
            except Exception as e:
                print(f"        Warning: Failed to rename {dir_path}: {e}")
    
    def _rename_file_content(self, file_path: Path) -> None:
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            original_content = content
            
            content = self._apply_replacement(content)

            if content != original_content:
                if self.config.dry_run:
                    print(f"      [DRY RUN] Would modify: {file_path.relative_to(self.project_root)}")
                else:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(content)
                    print(f"       Modified {file_path.relative_to(self.project_root)}")
                self.modified_files += 1
                
        except UnicodeDecodeError:
            # Skip binary files
            pass
        except Exception as e:
            raise Exception(f"Error processing {file_path}: {e}")
    
    def _get_renamed_filename(self, filename: str) -> str:
        """Get the new filename after applying all rename variants"""
        return self._apply_replacement(filename)
    
    def _apply_replacement(self, text: str) -> str:
        if not text:
            return text
        
        result = text
        
        # Create replacement pairs sorted by length (longest first)
        # This ensures that longer patterns are matched before shorter ones
        replacement_pairs = []
        
        for from_variant, to_variant in zip(self.from_variants.values(), self.to_variants.values()):
            if from_variant != to_variant and from_variant:
                replacement_pairs.append((from_variant, to_variant))
        
        # Sort by length of the 'from' string (longest first)
        replacement_pairs.sort(key=lambda x: len(x[0]), reverse=True)
        
        result = self._apply_substring_replacement(result, replacement_pairs)
        
        return result
    
    def _apply_substring_replacement(self, text: str, replacement_pairs: List[Tuple[str, str]]) -> str:
        result = text
        replacements_made = 0
        
        for from_str, to_str in replacement_pairs:
            if not from_str:  # Skip empty strings
                continue
                
            if self.config.case_sensitive:
                # Simple case-sensitive replacement
                if from_str in result:
                    old_result = result
                    result = result.replace(from_str, to_str)
                    replacements_made += old_result.count(from_str)
            else:
                # Case-insensitive replacement with case preservation
                import re
                
                def preserve_case_replacement(match):
                    matched_text = match.group(0)
                    
                    # If the matched text is all uppercase, make replacement uppercase
                    if matched_text.isupper():
                        return to_str.upper()
                    # If the matched text is all lowercase, make replacement lowercase
                    elif matched_text.islower():
                        return to_str.lower()
                    # If the matched text starts with uppercase (Title case), preserve that
                    elif matched_text[0].isupper():
                        return to_str[0].upper() + to_str[1:].lower() if len(to_str) > 1 else to_str.upper()
                    # For mixed case, try to preserve the original pattern
                    else:
                        return to_str
                
                # Use regex for case-insensitive matching
                pattern = re.escape(from_str)
                old_result = result
                result = re.sub(pattern, preserve_case_replacement, result, flags=re.IGNORECASE)
                
                # Count replacements
                if result != old_result:
                    replacements_made += len(re.findall(pattern, old_result, re.IGNORECASE))
        
        self.total_replacements += replacements_made
        return result
    
    def _apply_word_boundary_replacement_internal(self, text: str, replacement_pairs: List[Tuple[str, str]]) -> str:
        """Apply word boundary replacement (avoids partial word matches) - REMOVED"""
        # This method is no longer used since we removed use_word_boundaries
        return text
    
    def _get_files_to_process(self) -> List[Path]:
        """Get list of files to process"""
        files = []
        
        for root, dirs, filenames in os.walk(self.project_root):
            # Filter out excluded directories
            dirs[:] = [d for d in dirs if d not in self.config.exclude_dirs]
            
            for filename in filenames:
                if filename not in self.config.exclude_files:
                    file_path = Path(root) / filename
                    files.append(file_path)
        
        return files
    
    def _get_directories_to_process(self) -> List[Path]:
        directories = []
        
        for root, dirs, filenames in os.walk(self.project_root):
            # Filter out excluded directories
            dirs[:] = [d for d in dirs if d not in self.config.exclude_dirs]
            
            for dirname in dirs:
                dir_path = Path(root) / dirname
                directories.append(dir_path)
        
        return directories
    
    def _should_process_file(self, file_path: Path) -> bool:
        """Check if file should be processed based on extension or specific filename"""
        filename = file_path.name
        
        # Check if it's a file without extension that we want to process
        if not file_path.suffix:  # No extension
            if self.config.files_without_extension:
                return filename in self.config.files_without_extension
            else:
                # If files_without_extension is empty/None, process all files without extensions
                return True
        
        # Check if it has an extension we want to process
        if not self.config.file_extensions:
            return True
        
        return file_path.suffix.lower() in self.config.file_extensions
    
    def _print_summary(self) -> None:
        if self.config.dry_run:
            print(f"\n Dry run summary (no changes made):")
            print(f"   Files that would be renamed: {self.renamed_files}")
            print(f"   Folders that would be renamed: {self.renamed_folders}")
            print(f"   Files that would be modified: {self.modified_files}")
            print(f"   Total replacements that would be made: {self.total_replacements}")
        else:
            print(f"\n Rename operation summary:")
            print(f"   Files renamed: {self.renamed_files}")
            print(f"   Folders renamed: {self.renamed_folders}")
            print(f"   Files modified: {self.modified_files}")
            print(f"   Total replacements: {self.total_replacements}")
        
        if self.total_replacements > 0:
            print(f"\n Examples of replacements made:")
            for variant_name, (from_val, to_val) in zip(
                list(self.from_variants.keys())[:3],
                list(zip(self.from_variants.values(), self.to_variants.values()))[:3]
            ):
                if from_val != to_val:
                    print(f"   {from_val} → {to_val}")
                    # Show examples of how this would work in context
                    examples = [
                        f"{from_val}Manager → {to_val}Manager",
                        f"init{from_val} → init{to_val}",
                        f"{from_val}.framework → {to_val}.framework"
                    ]
                    print(f"      (e.g., {examples[0]})")
                    break


class ConfigGenerator:
    """
    Main class for generating configuration files
    
    Encapsulates all logic for creating various types
    of Swift configuration files.
    """
    
    def __init__(self, config: BuildConfig, output_dir: str = default_output_dir):
        self.config = config
        self.output_dir = Path(output_dir)
        self.build_time = datetime.now(timezone.utc)
        
        # Create output directory if it doesn't exist
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        print(f"   API URL: {config.api_host}")
        print(f"   SOCKET API URL: {config.socket_host}")
        print(f"   Output directory: {self.output_dir}")
    
    def generate_all(self) -> None:
        """
        Generates all configuration files
        """
        print("\n Generating configuration files...")
        
        try:
            self._generate_app_config()
            self._generate_config_index()
            self._update_gitignore()
            
            print("\n All configuration files generated successfully!")
            
        except Exception as e:
            print(f"\n Error generating configuration: {e}")
            sys.exit(1)
    
    def _generate_app_config(self) -> None:
        """Generates the main application configuration file"""
        print("\n Generating AppConfig.swift...")

        # Remove https:// or http:// prefix if present
        api_host = self.config.api_host.removeprefix("https://").removeprefix("http://")
        socket_host = self.config.socket_host.removeprefix("https://").removeprefix("http://")

        # Use triple quotes for multiline Swift code
        # f-strings allow inserting Python variables directly into the text
        swift_code = f'''// Automatically generated configuration file
// DO NOT EDIT MANUALLY - will be overwritten during build
// Generated: {self.build_time.isoformat()}

import Foundation

/// Application configuration generated during build
public struct AppConfig {{
    /// Base API URL
    public static let apiHost = "{api_host}"

    /// Base SOCKET API URL
    public static let socketHost = "{socket_host}"
}}

'''

        self._write_swift_file("AppConfig.swift", swift_code)

    
    def _generate_config_index(self) -> None:
        swift_code = '''// Index file for all configurations
// Provides a single access point to all configuration types

@_exported import Foundation

/// Main access point to all configurations
public struct Config {
    /// Main application configuration
    public static let app = AppConfig.self
    
    /// Validate all configurations
    public static func validateAll() -> Bool {
        guard let _ = URL(string: AppConfig.apiHost) else {
            print("Invalid API HOST")
            return false
        }
        
        return true
    }
    
    /// Print debug information about the configuration
    public static func printDebugInfo() {
        print(" Application configuration:")
        print("   API HOST: \\(AppConfig.apiHost)")
        print("   SOCKET HOST: \\(AppConfig.socketHost)")
    }
}
'''
        
        self._write_swift_file("ConfigIndex.swift", swift_code)
    
    def _write_swift_file(self, filename: str, content: str) -> None:
        file_path = self.output_dir / filename
        
        try:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"      {filename} created")
        except IOError as e:
            raise Exception(f"Failed to write file {filename}: {e}")
    
    def _update_gitignore(self) -> None:
        """Updates .gitignore to exclude generated files"""
        gitignore_path = Path(".gitignore")
        
        generated_entry = f"\n# Automatically generated configuration files\n{self.output_dir}/\n"
        
        if gitignore_path.exists():
            with open(gitignore_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            if str(self.output_dir) not in content:
                with open(gitignore_path, 'a', encoding='utf-8') as f:
                    f.write(generated_entry)
                print("      .gitignore updated")
        else:
            with open(gitignore_path, 'w', encoding='utf-8') as f:
                f.write(generated_entry)
            print("      .gitignore created")


def load_config_from_file(config_file: str) -> Dict[str, Any]:
    try:
        with open(config_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f" Configuration file {config_file} not found")
        sys.exit(1)
    except json.JSONDecodeError as e:
        print(f" JSON parsing error in file {config_file}: {e}")
        sys.exit(1)


def create_sample_config_file(filename: str = "config.json") -> None:
    sample_config = {
        "api_host": "https://sdk.api.example.com",
        "socket_host" : "https://paymentpage.api.example.com",
    }
    
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(sample_config, f, indent=2)
    
    print(f" Sample configuration file created: {filename}")


def create_sample_rename_config(filename: str = "rename_config.json") -> None:
    sample_config = {
        "merchant_name": "sample",
        "project_root": ".",
        "exclude_dirs": [".git", ".build", ".idea"],
        "exclude_files": [".DS_Store", ".gitignore", "gen_config.py", "rename_config.json"],
        "file_extensions": [".swift", ".h", ".m", ".mm", ".json", ".plist", ".md", ".txt", ".xml", ".podspec", ".pbxproj", ".xcscheme", ".entitlements"],
        "files_without_extension": ["Podfile"],
        "case_sensitive": False,
        "dry_run": True
    }
    
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(sample_config, f, indent=2)

    print(" Configuration options:")
    print("   file_extensions: List of file extensions to process (e.g., ['.swift', '.json'])")
    print("   files_without_extension: List of specific filenames without extensions")
    print("     (e.g., ['Podfile', 'Makefile', 'Dockerfile'])")
    print("   case_sensitive: false = preserve original case patterns and match case-insensitively")
    print("   case_sensitive: true  = exact case matching only")
    print("   dry_run: true = show what would be changed without making actual changes")
    print("   dry_run: false = perform actual renaming operations")
    print("\n Replacement behavior:")
    print("   'ecommpaySDK' → 'replacedSDK' will also replace:")
    print("   'EcommpaySDK' → 'ReplacedSDK' (preserving capitalization)")
    print("   'ECOMMPAYSDK' → 'REPLACEDSDK' (preserving uppercase)")
    print("   'EcommpaySDKManager' → 'ReplacedSDKManager' (substring replacement)")


def main():
    parser = argparse.ArgumentParser(
        description="Configuration generator for iOS project with renaming functionality",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Usage examples:
  %(prog)s --create-sample-config
  %(prog)s --config my-config.json
  %(prog)s --create-sample-rename-config
  %(prog)s --rename-config rename-config.json
        """
    )
    
    # Group for file operations
    file_group = parser.add_argument_group('File operations')
    file_group.add_argument('--config', help='Path to JSON configuration file')
    file_group.add_argument('--create-sample-config', action='store_true',
                           help='Create a sample configuration file')
    
    # Group for rename operations
    rename_group = parser.add_argument_group('Rename operations')
    rename_group.add_argument('--rename-config', help='Path to JSON rename configuration file')
    rename_group.add_argument('--create-sample-rename-config', action='store_true',
                             help='Create a sample rename configuration file')
    
    # Additional parameters
    parser.add_argument('--output-dir', default=default_output_dir,
                       help='Output directory (default: ' + default_output_dir + ')')
    
    args = parser.parse_args()
    
    # Handle special commands
    if args.create_sample_config:
        create_sample_config_file()
        return
    
    if args.create_sample_rename_config:
        create_sample_rename_config()
        return
    
    # Handle rename operations
    if args.rename_config:
        print(f" Loading rename configuration from file: {args.rename_config}")
        try:
            with open(args.rename_config, 'r', encoding='utf-8') as f:
                rename_data = json.load(f)
                
            rename_config = RenameConfig(
                from_name=original_name,
                merchant_name=rename_data['merchant_name'],
                project_root=rename_data.get('project_root', '.'),
                exclude_dirs=rename_data.get('exclude_dirs'),
                exclude_files=rename_data.get('exclude_files'),
                file_extensions=rename_data.get('file_extensions'),
                files_without_extension=rename_data.get('files_without_extension'),
                case_sensitive=rename_data.get('case_sensitive', False),
                dry_run=rename_data.get('dry_run', True)
            )
        except (FileNotFoundError, json.JSONDecodeError, KeyError) as e:
            print(f" Error loading rename configuration: {e}")
            sys.exit(1)

        renamer = ProjectRenamer(rename_config)
        renamer.rename_all()
        return
    
    if args.config:
        print(f" Loading configuration from file: {args.config}")
        config_data = load_config_from_file(args.config)
        
        build_config = BuildConfig(
            api_host=config_data['api_host'],
            socket_host=config_data['socket_host'],
        )
    else:
        print(" You must specify --config for configuration generation")
        print("   Or use rename operations with --rename-config")
        parser.print_help()
        sys.exit(1)
    
    # Generate configuration
    generator = ConfigGenerator(build_config, args.output_dir)
    generator.generate_all()


if __name__ == "__main__":
    main()
