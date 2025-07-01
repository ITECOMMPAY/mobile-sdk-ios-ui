// Index file for all configurations
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
        print("   API HOST: \(AppConfig.apiHost)")
        print("   SOCKET HOST: \(AppConfig.socketHost)")
    }
}
