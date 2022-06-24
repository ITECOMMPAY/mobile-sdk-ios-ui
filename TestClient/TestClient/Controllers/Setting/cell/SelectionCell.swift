//
//  SelectionCell.swift
//  TestClient
//
//  Created by Виталий Морозов on 10.09.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import UIKit

class SelectionCell: UITableViewCell {

    static var identifier = "SelectionCellIdentifier"
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var selectionLogo: UIImageView?
    
    private var value: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(displayModeVO: DisplayModeVO,
               index: Int) {
        
        titleLabel?.text = displayModeVO.screenDisplayMode.description
        self.value = displayModeVO.value
        self.selectionLogo?.image = UIImage(named: self.value ? "select_selection_logo" : "no_select_selection_logo")!
    }
}
