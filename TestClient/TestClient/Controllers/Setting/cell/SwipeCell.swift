//
//  SwipeCell.swift
//  TestClient
//
//  Created by Виталий Морозов on 09.09.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import UIKit

protocol SwipeCellCallback {
    func onChangeValue(value: Bool, index: Int)
}

class SwipeCell: UITableViewCell {

    static let identifier: String = "SwipeCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var switcher: UISwitch?

    private var value: Bool = false
    private var index: Int?
    private var callback: SwipeCellCallback?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setup(title: String,
               index: Int,
               callback: SwipeCellCallback?) {
        self.callback = callback
        self.index = index
        titleLabel?.text = title
        self.value = switcher?.isOn == true

        callback?.onChangeValue(value: self.value, index: index)
    }

    @IBAction func onChangeValue(_ smySwitch: UISwitch) {
        self.value = switcher?.isOn == true
        callback?.onChangeValue(value: self.value, index: index ?? -1)
    }
}
