//
//  ScheduleTableViewCell.swift
//  TestClient
//
//  Created by Deniss Kaibagarovs on 06/06/2019.
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

protocol ScheduleTableViewCellDelegate: class {
    func onItemRemove(item: RecurrentInfoSchedule)
}

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var textFieldAmount: UITextField!

    public weak var delegate: ScheduleTableViewCellDelegate?
    private var item: RecurrentInfoSchedule!
    public static let identifier: String = "ScheduleTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func onRemovePress(_ sender: Any) {
        self.delegate?.onItemRemove(item: self.item)
    }

    func setupWith(item: RecurrentInfoSchedule) {
        self.item = item
        self.textFieldDate.text = item.date
        self.textFieldAmount.text = "\(item.amount)"
    }
}

extension ScheduleTableViewCell: UITextViewDelegate {

}
