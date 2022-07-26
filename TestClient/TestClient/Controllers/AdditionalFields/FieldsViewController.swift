//
//  AdditionalFieldsViewController.swift
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

@objc protocol FieldsViewControllerDelegate {
    func onCloseAdditionalFields(items: [AdditionalField])
}

class FieldsViewController: UIViewController {

    @IBOutlet weak var tableViewAdditional: UITableView!

    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @objc public weak var delegate: FieldsViewControllerDelegate?
    @objc public var fieldObjects: [AdditionalField] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.fieldObjects.count == 0 { composeObjects() }

        self.tableViewAdditional.tableFooterView = UIView()
        self.tableViewAdditional.register(UINib(nibName: "AdditionalTableViewCell", bundle: nil), forCellReuseIdentifier: AdditionalTableViewCell.identifier)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func onClosePress(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.delegate?.onCloseAdditionalFields(items: self.fieldObjects)
        })
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardRectValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardRectValue.height
            self.tableViewBottomConstraint.constant = keyboardHeight
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.tableViewBottomConstraint.constant = 0
    }

    func composeObjects() {
        for fieldType in AdditionalFieldType.allCases {
            self.fieldObjects.append(AdditionalField(type: fieldType, value: ""))
        }
    }
}

extension FieldsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fieldObjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AdditionalTableViewCell = tableView.dequeueReusableCell(withIdentifier: AdditionalTableViewCell.identifier, for: indexPath) as! AdditionalTableViewCell

        let object: AdditionalField = self.fieldObjects[indexPath.row]
        cell.setup(field: object)
        return cell
    }
}
