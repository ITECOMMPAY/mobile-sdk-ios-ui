//
//  SettingViewController.swift
//  TestClient
//
//  Created by Виталий Морозов on 09.06.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import UIKit
#if ODTSDK
import ODTSDK
typealias ScreenDisplayMode = ODTScreenDisplayMode
#elseif JETPAY
import jetpayhostsSDK
typealias ScreenDisplayMode = JetpayHostsScreenDisplayMode
#else
import ecommpaySDK
typealias ScreenDisplayMode = ECMPScreenDisplayMode
#endif

struct DisplayModeVO {
    var value: Bool
    var screenDisplayMode: ScreenDisplayMode
}

@objc protocol SettingViewControllerDelegate {
    func onSetupHideSavedWallets(value: Bool)
    func onSetupScreenMode(screenDisplayModes: [String])
}

@objc class SettingVO: NSObject {
   var hideSavedWallets: Bool = false
   var screenDisplayModes: [ScreenDisplayMode] = []
}

class SettingViewController: UIViewController {

    @IBOutlet weak var settingList: UITableView?
    
    var hideSavedWallets = false
    var settingVO: SettingVO?
    var screenDisplayModes: [ScreenDisplayMode] = []
    var displayVOList: [DisplayModeVO] = []
    
    @objc public var delegate: SettingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingVO = SettingVO()
        self.settingVO?.screenDisplayModes = ScreenDisplayMode.allCases
        
        for mode in self.settingVO!.screenDisplayModes {
            self.displayVOList.append(DisplayModeVO(value: false, screenDisplayMode: mode))
        }
        
        settingList?.dataSource = self
        settingList?.delegate = self
        
        settingList?.register(UINib.init(nibName: "SelectionCell", bundle: nil), forCellReuseIdentifier: SelectionCell.identifier)
        settingList?.register(UINib.init(nibName: "SwipeCell", bundle: nil), forCellReuseIdentifier: SwipeCell.identifier)
    }

    @IBAction func onDone(_ sender: Any) {
        for vo in displayVOList {
            if (vo.value) { screenDisplayModes.append(vo.screenDisplayMode) }
        }
        
        self.dismiss(animated: true, completion: {
            self.settingVO?.hideSavedWallets = self.hideSavedWallets
            self.settingVO?.screenDisplayModes = self.screenDisplayModes
            
            if let settingVO = self.settingVO {
                self.delegate?.onSetupHideSavedWallets(value: settingVO.hideSavedWallets)
                self.delegate?.onSetupScreenMode(screenDisplayModes: settingVO.screenDisplayModes.map { mode in mode.description })
            }
        })
    }
}
