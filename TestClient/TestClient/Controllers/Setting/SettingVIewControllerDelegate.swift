//
//  SettingVIewControllerDelegate.swift
//  TestClient
//
//  Created by Виталий Морозов on 09.09.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import Foundation
#if ODTSDK
import ODTSDK
#elseif JETPAY
import jetpayhostsSDK
#else
import ecommpaySDK 
#endif

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Display configuration"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ScreenDisplayMode.allCases.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
                
        if (indexPath.row == 0) {
            cell = tableView.dequeueReusableCell(withIdentifier: SwipeCell.identifier, for: indexPath)
            (cell as? SwipeCell)?.setup(
                title: "Hide saved wallets",
                index: indexPath.row,
                callback: self)
        } else {
           cell = tableView.dequeueReusableCell(withIdentifier: SelectionCell.identifier, for: indexPath)
            (cell as? SelectionCell)?.setup(displayModeVO: displayVOList[indexPath.row - 1], index: indexPath.row)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row != 0) {
            displayVOList[indexPath.row - 1].value = !displayVOList[indexPath.row - 1].value
            tableView.reloadData()
        }
    }
}

extension SettingViewController: SwipeCellCallback {
    
    func onChangeValue(value: Bool, index: Int) {
        if index == 0 {
            self.hideSavedWallets = value
        }
    }
}

