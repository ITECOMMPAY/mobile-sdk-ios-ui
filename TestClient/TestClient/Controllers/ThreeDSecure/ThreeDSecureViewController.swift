//
//  ThreeDSecureViewController.swift
//  TestClient
//
//  Created by Виталий Морозов on 29.04.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import UIKit
#if ODTSDK
import ODTSDK
#elseif JETPAY
import jetpayhostsSDK
#else
import ecommpaySDK
#endif

@objc protocol ThreeDSecureViewControllerDelegate {
    func onDoneThreeDSecureParams(item: ThreeDSecureDTO)
}

class ThreeDSecureViewController: UIViewController, ThreeDSecureViewCellDelegate {

    @IBOutlet weak var paramTableView: UITableView!

    @objc public var vo: [ThreeDSecureVO] = []
    @objc public weak var delegate: ThreeDSecureViewControllerDelegate?
    @IBOutlet weak var sendDataSW: UISwitch!

    private var isSendData: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        self.vo = ThreeDSecureHelper.getVO()

        self.paramTableView.dataSource = self
        self.paramTableView.rowHeight = UITableView.automaticDimension

        self.paramTableView.register(UINib.init(nibName: "ThreeDSecureViewCell", bundle: Bundle(for: ThreeDSecureViewController.self)), forCellReuseIdentifier: ThreeDSecureViewCell.identifier)

    }

    override func viewDidLayoutSubviews() {
        self.paramTableView.layoutIfNeeded()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

    }

    @IBAction func onDone(_ sender: Any) {
        let dto = ThreeDSecureDTO(self.isSendData, TheeDSecureInfoToRequestObjectMapper().map(viewObjectList: self.vo))
        self.dismiss(animated: true, completion: {
            self.delegate?.onDoneThreeDSecureParams(item: dto)
        })
    }

    @IBAction func onChangeState(_ smySwitch: UISwitch) {
        isSendData = smySwitch.isOn
    }

    func onChangeJson(vo: ThreeDSecureVO) {
        self.vo.forEach { (voElement) in
            if voElement.type == vo.type {
                voElement.json = vo.json
            }
        }
    }
}

extension ThreeDSecureViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThreeDSecureViewCell.identifier, for: indexPath) as! ThreeDSecureViewCell
        cell.configure(vo[indexPath.row], self)
        return cell
    }
}
