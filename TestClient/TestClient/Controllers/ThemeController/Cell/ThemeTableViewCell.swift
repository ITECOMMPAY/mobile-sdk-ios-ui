//
//  ThemeTableViewCell.swift
//  TestClient
//
//  Created by Deniss Kaibagarovs on 29/05/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import UIKit

protocol ThemeTableViewCellDelegate: class {
    func onColorSelectionStart(item: String, view: UIView)
    func onBoolSelectionChange(item: String, newBoolValue: Bool)
}

class ThemeTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonColor: UIButton!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var switchValue: UISwitch!

    public static let identifier: String = "ThemeTableViewCell"
    public weak var delegate: ThemeTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func onColorSelection(_ sender: Any) {
        self.delegate?.onColorSelectionStart(item: labelName.text ?? "", view: sender as! UIView)
        selected(selected: true)
    }

    func setup(name: String, color: UIColor) {
        self.labelName.text = name
        self.buttonColor.backgroundColor = color

        self.buttonColor.isHidden = false
        self.switchValue.isHidden = true
    }

    func setup(name: String, value: Bool) {
        self.labelName.text = name
        self.switchValue.isOn = value

        self.switchValue.isHidden = false
        self.buttonColor.isHidden = true
    }

    func selected(selected: Bool) {
        self.contentView.backgroundColor = selected ? UIColor.lightGray : UIColor.white
    }

    @IBAction func onSwitchValueChange(_ sender: UISwitch) {
        self.delegate?.onBoolSelectionChange(item: labelName.text ?? "", newBoolValue: sender.isOn)
    }
}
