//
//  ScheduleButtonTableViewCell.swift
//  TestClient
//
//  Created by Deniss Kaibagarovs on 06/06/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//

import UIKit

protocol ScheduleButtonTableViewCellDelegate: class {
    func onAddNew()
}

class ScheduleButtonTableViewCell: UITableViewCell {

    public weak var delegate: ScheduleButtonTableViewCellDelegate?
    public static let identifier: String = "ScheduleButtonTableViewCell"
    
    @IBAction func onAddNewPress(_ sender: Any) {
        self.delegate?.onAddNew()
    }
}
