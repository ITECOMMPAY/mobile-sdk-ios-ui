//
//  ThemeViewController.swift
//  TestClient
//
//  Created by Deniss Kaibagarovs on 28/05/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import UIKit
import ecommpaySDK
import EFColorPicker

class ThemeViewController: UIViewController {

    @IBOutlet weak var tableViewTheme: UITableView!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    var currentViewToColor: UIView?
    var indexToUpdateTheme: Int = 0 //TODO: remove
    var currentNameToUpdate: String = ""
    var colorController: EFColorSelectionViewController?
    var themeObjects: [ThemeObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
        self.tableViewTheme.delegate = self
        themeSwitch.isOn = ThemeSetup.shared.isDarkThemeOn
        tableViewTheme.register(UINib(nibName: "ThemeTableViewCell", bundle: nil), forCellReuseIdentifier: ThemeTableViewCell.identifier)
    }

    @IBAction func onResetPress(_ sender: Any) {
        ThemeSetup.shared.theme = ThemeSetup.shared.isDarkThemeOn ? ECPTheme.getDarkTheme() : ECPTheme.getLightTheme()
        reset()
    }
    
    @IBAction func onDonePress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSwitchValueChange(_ sender: UISwitch) {
        ThemeSetup.shared.isDarkThemeOn = sender.isOn
        ThemeSetup.shared.theme = ThemeSetup.shared.isDarkThemeOn ? ECPTheme.getDarkTheme() : ECPTheme.getLightTheme()
        reset()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "EFColorSelectionViewController") {
            let vc = segue.destination as! EFColorSelectionViewController
            vc.delegate = self
            vc.isColorTextFieldHidden = false
            colorController = vc
        }
    }
    
    func reset() {
        themeObjects.removeAll()
        composeThemeObjects(currentTheme: ThemeSetup.shared.theme)
        tableViewTheme.reloadData()
    }
    
    func composeThemeObjects(currentTheme:ECPTheme) {
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.overlayColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.backgroundColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.headingTextColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.menuTextColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.fieldTextColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.supportiveTextColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.fieldPlaceholderTextColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.fieldImageTintColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.fieldTextCorrectColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.fieldTextWrongColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.fieldBackgroundColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.selectorColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.selectorBackgroundColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.primaryTintColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.secondaryTintColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.separatorColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.actionButtonDisableBackgroundColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.actionButtonDisableTextColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.actionButtonTextColor.rawValue))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.showShadow.rawValue, isBoolValue: true, boolValue: ThemeSetup.shared.theme.showShadow))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.showDarkKeyboard.rawValue, isBoolValue: true, boolValue: ThemeSetup.shared.theme.showDarkKeyboard))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.showDarkNavigationBar.rawValue, isBoolValue: true, boolValue: ThemeSetup.shared.theme.showDarkNavigationBar))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.showLightLogo.rawValue, isBoolValue: true, boolValue: ThemeSetup.shared.theme.showLightLogo))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.apsLogoOnly.rawValue, isBoolValue: true, boolValue: ThemeSetup.shared.theme.apsLogoOnly))
        self.themeObjects.append(ThemeObject(name: ThemeObjectConstNames.showLightAPSLogos.rawValue, isBoolValue: true, boolValue: ThemeSetup.shared.theme.showLightAPSLogos))
    }
    
    func updateTheme(name: String, color: UIColor) {
        switch name {
        case ThemeObjectConstNames.overlayColor.rawValue:                       ThemeSetup.shared.theme.overlayColor = color
        case ThemeObjectConstNames.backgroundColor.rawValue:                    ThemeSetup.shared.theme.backgroundColor = color
        case ThemeObjectConstNames.headingTextColor.rawValue:                   ThemeSetup.shared.theme.headingTextColor = color
        case ThemeObjectConstNames.menuTextColor.rawValue:                      ThemeSetup.shared.theme.menuTextColor = color
        case ThemeObjectConstNames.fieldTextColor.rawValue:                     ThemeSetup.shared.theme.fieldTextColor = color
        case ThemeObjectConstNames.supportiveTextColor.rawValue:                ThemeSetup.shared.theme.supportiveTextColor = color
        case ThemeObjectConstNames.fieldPlaceholderTextColor.rawValue:          ThemeSetup.shared.theme.fieldPlaceholderTextColor = color
        case ThemeObjectConstNames.fieldImageTintColor.rawValue:                ThemeSetup.shared.theme.fieldImageTintColor = color
        case ThemeObjectConstNames.fieldTextCorrectColor.rawValue:              ThemeSetup.shared.theme.fieldTextCorrectColor = color
        case ThemeObjectConstNames.fieldTextWrongColor.rawValue:                ThemeSetup.shared.theme.fieldTextWrongColor = color
        case ThemeObjectConstNames.fieldBackgroundColor.rawValue:               ThemeSetup.shared.theme.fieldBackgroundColor = color
        case ThemeObjectConstNames.selectorColor.rawValue:                      ThemeSetup.shared.theme.selectorColor = color
        case ThemeObjectConstNames.selectorBackgroundColor.rawValue:            ThemeSetup.shared.theme.selectorBackgroundColor = color
        case ThemeObjectConstNames.primaryTintColor.rawValue:                   ThemeSetup.shared.theme.primaryTintColor = color
        case ThemeObjectConstNames.secondaryTintColor.rawValue:                 ThemeSetup.shared.theme.secondaryTintColor = color
        case ThemeObjectConstNames.separatorColor.rawValue: 	                ThemeSetup.shared.theme.lineColor = color
        case ThemeObjectConstNames.actionButtonDisableBackgroundColor.rawValue: ThemeSetup.shared.theme.actionButtonDisableBackgroundColor = color
        case ThemeObjectConstNames.actionButtonDisableTextColor.rawValue:       ThemeSetup.shared.theme.actionButtonDisableTextColor = color
        case ThemeObjectConstNames.actionButtonTextColor.rawValue:              ThemeSetup.shared.theme.actionButtonTextColor = color
        default:
            break
        }
    }
    
    func updateTheme(name: String, boolValue: Bool) {
        switch name {
        case ThemeObjectConstNames.showShadow.rawValue:               ThemeSetup.shared.theme.showShadow = boolValue
        case ThemeObjectConstNames.showDarkKeyboard.rawValue:         ThemeSetup.shared.theme.showDarkKeyboard = boolValue
        case ThemeObjectConstNames.showDarkNavigationBar.rawValue:    ThemeSetup.shared.theme.showDarkNavigationBar = boolValue
        case ThemeObjectConstNames.showLightLogo.rawValue:            ThemeSetup.shared.theme.showLightLogo = boolValue
        case ThemeObjectConstNames.apsLogoOnly.rawValue:              ThemeSetup.shared.theme.apsLogoOnly = boolValue
        case ThemeObjectConstNames.showLightAPSLogos.rawValue:        ThemeSetup.shared.theme.showLightAPSLogos = boolValue
        default:
            break
        }
    }
    
    func getColorForThemeName(name: String) -> UIColor {
        switch name {
        case ThemeObjectConstNames.overlayColor.rawValue:                       return ThemeSetup.shared.theme.overlayColor
        case ThemeObjectConstNames.backgroundColor.rawValue:                    return ThemeSetup.shared.theme.backgroundColor
        case ThemeObjectConstNames.headingTextColor.rawValue:                   return ThemeSetup.shared.theme.headingTextColor
        case ThemeObjectConstNames.menuTextColor.rawValue:                      return ThemeSetup.shared.theme.menuTextColor
        case ThemeObjectConstNames.fieldTextColor.rawValue:                     return ThemeSetup.shared.theme.fieldTextColor
        case ThemeObjectConstNames.supportiveTextColor.rawValue:                return ThemeSetup.shared.theme.supportiveTextColor
        case ThemeObjectConstNames.fieldPlaceholderTextColor.rawValue:          return ThemeSetup.shared.theme.fieldPlaceholderTextColor
        case ThemeObjectConstNames.fieldImageTintColor.rawValue:                return ThemeSetup.shared.theme.fieldImageTintColor
        case ThemeObjectConstNames.fieldTextCorrectColor.rawValue:              return ThemeSetup.shared.theme.fieldTextCorrectColor
        case ThemeObjectConstNames.fieldTextWrongColor.rawValue:                return ThemeSetup.shared.theme.fieldTextWrongColor
        case ThemeObjectConstNames.fieldBackgroundColor.rawValue:               return ThemeSetup.shared.theme.fieldBackgroundColor
        case ThemeObjectConstNames.selectorColor.rawValue:                      return ThemeSetup.shared.theme.selectorColor
        case ThemeObjectConstNames.selectorBackgroundColor.rawValue:            return ThemeSetup.shared.theme.selectorBackgroundColor
        case ThemeObjectConstNames.primaryTintColor.rawValue:                   return ThemeSetup.shared.theme.primaryTintColor
        case ThemeObjectConstNames.secondaryTintColor.rawValue:                 return ThemeSetup.shared.theme.secondaryTintColor
        case ThemeObjectConstNames.separatorColor.rawValue:                     return ThemeSetup.shared.theme.lineColor
        case ThemeObjectConstNames.actionButtonDisableBackgroundColor.rawValue: return ThemeSetup.shared.theme.actionButtonDisableBackgroundColor
        case ThemeObjectConstNames.actionButtonDisableTextColor.rawValue:       return ThemeSetup.shared.theme.actionButtonDisableTextColor
        case ThemeObjectConstNames.actionButtonTextColor.rawValue:              return ThemeSetup.shared.theme.actionButtonTextColor
        default:
            return UIColor.white
        }
    }
}

extension ThemeViewController: EFColorSelectionViewControllerDelegate {
    func colorViewController(_ colorViewCntroller: EFColorSelectionViewController,
                             didChangeColor color: UIColor) {
        
        if let currentViewToColor = self.currentViewToColor {
            currentViewToColor.backgroundColor = color
        }
        
        updateTheme(name: currentNameToUpdate, color: color)
    }
}

extension ThemeViewController: ThemeTableViewCellDelegate {
    func onBoolSelectionChange(item: String, newBoolValue: Bool) {
        updateTheme(name: item, boolValue: newBoolValue)
    }
    
    func onColorSelectionStart(item: String, view: UIView) {
        clearSelection()
        currentNameToUpdate = item
        
        if let colorController = self.colorController {
            currentViewToColor = view
            colorController.color = view.backgroundColor ?? UIColor.white
        }
    }
}

extension ThemeViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.themeObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let themeObject = self.themeObjects[indexPath.row]
        let cell: ThemeTableViewCell = tableView.dequeueReusableCell(withIdentifier: ThemeTableViewCell.identifier, for: indexPath) as! ThemeTableViewCell
        cell.delegate = self
        if(themeObject.isBoolValue) {
            cell.setup(name: themeObject.name, value: themeObject.boolValue)
        } else {
            cell.setup(name: themeObject.name, color: getColorForThemeName(name: themeObject.name))
        }
        
        cell.selected(selected: false)
        
        return cell
    }
    
    func clearSelection() {
        for item in self.tableViewTheme!.visibleCells {
            if let item = item as? ThemeTableViewCell {
                item.selected(selected: false)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.currentNameToUpdate = ""
        self.currentViewToColor = nil
        clearSelection()
    }
}
