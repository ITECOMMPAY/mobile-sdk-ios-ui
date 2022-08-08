//
//  AdditionalTableViewCell.swift
//  TestClient
//
//  Created by Deniss Kaibagarovs on 20/06/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import UIKit
#if ODTSDK
import ODTSDK
#elseif JETPAY
import jetpayhostsSDK
#else
import ecommpaySDK
#endif

import MsdkCore

class AdditionalTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var editFieldKey: UITextField!
    var additionalField: AdditionalField!
    public static let identifier: String = "AdditionalTableViewCell"

    private let EDIT_TEXT_KEY_TAG = 100

    func setup(field: AdditionalField) {
        self.additionalField = field
        self.textField.text = field.value
        self.labelName?.text = field.type.rawValue
        self.editFieldKey.isHidden = field.type != .custom
    }
}

extension AdditionalTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)

            self.additionalField.value = updatedText
        }
        return true
    }
}
 
