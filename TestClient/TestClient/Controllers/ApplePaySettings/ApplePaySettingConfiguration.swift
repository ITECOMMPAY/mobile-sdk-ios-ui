//
//  ApplePaySettingConfigure.swift
//  TestClient
//
//  Created by Виталий Морозов on 02.02.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import Foundation

class ApplePaySettingConfiguration: NSObject {

    @objc(configure)
    func configure() -> UIViewController {
        let viewController = ApplePaySettingViewController()
        let presenter = ApplePaySettingPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
