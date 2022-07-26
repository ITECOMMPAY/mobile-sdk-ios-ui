//
//  RecipientInfoViewController.swift
//  TestClient
//
//  Created by Ivan Krapivev on 16.05.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

import UIKit

#if ODTSDK
import ODTSDK
#elseif JETPAY
import jetpayhostsSDK
#else
import ecommpaySDK
#endif

@objc protocol RecipientInfoViewControllerDelegate {
    func onClose(with info: RecipientInfo?)
}

class RecipientInfoViewController: UIViewController {
    @objc public weak var delegate: RecipientInfoViewControllerDelegate?

    @objc class func intantiateWith(info: RecipientInfo?) -> RecipientInfoViewController {
        let vc = RecipientInfoViewController(nibName: "RecipientInfoViewController", bundle: nil)
        vc.isOn = info != nil
        vc.walletOwner = info?.walletOwner
        vc.walletId = info?.walletId
        vc.country = info?.country
        return vc
    }

    private var isOn: Bool = false
    private var walletOwner: String?
    private var walletId: String?
    private var country: String?

    @IBOutlet weak var walletOwnerField: UITextField!
    @IBOutlet weak var walletIdField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var toggleSwitch: UISwitch!

    @IBAction func toggleRecipientInfo(_ sender: UISwitch) {
        isOn = sender.isOn
        walletOwnerField.isEnabled = isOn
        walletIdField.isEnabled = isOn
        countryField.isEnabled = isOn
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        walletOwnerField.text = walletOwner
        walletIdField.text = walletId
        countryField.text = country
        toggleSwitch.isOn = isOn
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            guard self.isOn else {
                self.delegate?.onClose(with: nil)
                return
            }
            self.delegate?.onClose(with: RecipientInfo(walletOwner: self.walletOwnerField.text,
                                                       walletId: self.walletIdField.text,
                                                       country: self.countryField.text))
        })
    }

}
