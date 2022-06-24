//
//  ScheduleViewController.swift
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

@objc protocol ScheduleViewControllerDelegate {
    func onClose(items: [RecurrentInfoSchedule])
}

class ScheduleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @objc public weak var delegate: ScheduleViewControllerDelegate?
    @objc public var items:[RecurrentInfoSchedule] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier:  ScheduleTableViewCell.identifier)
         self.tableView.register(UINib(nibName: "ScheduleButtonTableViewCell", bundle: nil), forCellReuseIdentifier:  ScheduleButtonTableViewCell.identifier)
        
        self.items = [
            RecurrentInfoSchedule(date: "12-10-2020", amount: 1000),
            RecurrentInfoSchedule(date: "12-11-2020", amount: 1200)
        ]
    }
    
    @IBAction func onClosePress(_ sender: Any) {
        self.dismiss(animated: true, completion:{
            self.delegate?.onClose(items: self.items)
        })
    }
}

extension ScheduleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Button add
        if(indexPath.row == self.items.count) {
             let cell: ScheduleButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: ScheduleButtonTableViewCell.identifier, for: indexPath) as! ScheduleButtonTableViewCell
            cell.delegate = self
            return cell
        }
        
        let item = self.items[indexPath.row]
        let cell: ScheduleTableViewCell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as! ScheduleTableViewCell
        cell.delegate = self
        cell.setupWith(item: item)
        return cell
    }
}

extension ScheduleViewController: ScheduleTableViewCellDelegate, ScheduleButtonTableViewCellDelegate {
    
    func onItemRemove(item: RecurrentInfoSchedule) {
        self.items.remove(at:self.items.firstIndex(of: item)!)
        self.tableView.reloadData()
    }
    
    func onAddNew() {
        self.items.append(RecurrentInfoSchedule(date: "10-10-2020", amount: 1000))
        self.tableView.reloadData()
    }
}
