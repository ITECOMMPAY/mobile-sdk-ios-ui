//
//  ApplePaySettingViewController.swift
//  TestClient
//
//  Created by Виталий Морозов on 02.02.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import Foundation
import UIKit

protocol ApplePaySettingViewControllerProtocol {

    func setupFields(models: [SettingView.Model])
    func onFinish(models: [SettingView.Model])
}

@objc protocol ApplePaySettingViewControllerDelegate {
    func onFinish(data: [ApplePaySettingViewController.Data])
}

extension ApplePaySettingViewController {

    class Data: NSObject {
        let label: String
        let value: String

        init(label: String, value: String) {
            self.label = label
            self.value = value
        }
    }
}

class ApplePaySettingViewController: UIViewController {

    var presenter: ApplePaySettingPresenterProtocol?
    @objc public weak var delegate: ApplePaySettingViewControllerDelegate?

    private lazy var customView = ApplePaySettingView(frame: CGRect.init(x: 0, y: 0, width: 320, height: 480))

    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Apple Pay settings"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(onAddField(sender:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(onCancel(sender:)))

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onSubmit(sender:)))
        customView.btnApply.addGestureRecognizer(tapGesture)
    }

    @objc private func onAddField(sender: UITapGestureRecognizer) {
        presenter?.addNewField()
    }

    @objc private func onSubmit(sender: UITapGestureRecognizer) {
        view.endEditing(true)
        presenter?.onSubmit()
    }

    @objc private func onCancel(sender: UITapGestureRecognizer) {
        self.navigationController?.dismiss(animated: true)
    }
}

extension ApplePaySettingViewController: ApplePaySettingViewControllerProtocol {

    func setupFields(models: [SettingView.Model]) {
        customView.generateSettingViews(models: models) { [weak self] changedValue in
            self?.presenter?.changedValue(id: changedValue.id,
                                          title: changedValue.title,
                                          value: changedValue.value)
        }
    }

    func onFinish(models: [SettingView.Model]) {
        delegate?.onFinish(data: models.map({ Data(label: $0.title, value: $0.value) }))
    }
}
