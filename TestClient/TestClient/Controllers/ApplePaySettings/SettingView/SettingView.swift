//
//  SettingView.swift
//  TestClient
//
//  Created by Виталий Морозов on 02.02.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import UIKit

extension SettingView {

    struct Model {
        let id: String
        var title: String
        var value: String
        var isActive: Bool
    }

    struct ChangedValue {
        let id: String
        let title: String
        let value: String
    }
}

class SettingView: UIView {

    var changedValue: ((ChangedValue) -> Void)?
    var endEditing: (() -> Void)?

    var model: Model? {
        didSet {
            updateModel()
        }
    }

    private let stvContent = UIStackView().setupAutoLayout()

    private let titleFormContainer = UIView().setupAutoLayout()
    private let lblTitleForm = UILabel().setupAutoLayout()
    private let swActive = UISwitch().setupAutoLayout()

    private let stvTitleField = UIStackView().setupAutoLayout()
    private let lblTitle = UILabel().setupAutoLayout()
    private let efTitle = UITextField().setupAutoLayout()

    private let stvValueField = UIStackView().setupAutoLayout()
    private let lblValue = UILabel().setupAutoLayout()
    private let efValue = UITextField().setupAutoLayout()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    private func configure() {
        addSubviews()
        makeConstraints()

        backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)

        stvContent.axis = .vertical
        stvContent.alignment = .fill
        stvContent.distribution = .fill
        stvContent.spacing = 5.0

        lblTitleForm.textColor = UIColor.lightGray
        lblTitleForm.text = "PKPaymentSummaryItem: label - value \nExample: label - shirt, value - 300\nResult: shirt 300"
        lblTitleForm.lineBreakMode = .byWordWrapping
        lblTitleForm.numberOfLines = 0

        lblTitle.text = "Label: "
        lblValue.text = "Value: "

        efTitle.placeholder = "shirt"
        efTitle.delegate = self
        efValue.placeholder = "300"
        efValue.delegate = self

        addShadows()
    }
}

private extension SettingView {

    func addSubviews() {
        addSubview(stvContent)

        let stvContainerTitleField = getStackView(views: [lblTitle, efTitle])
        let stvContainerValueField = getStackView(views: [lblValue, efValue])

        lblTitle.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        lblValue.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        lblTitleForm.setContentHuggingPriority(.required, for: .horizontal)

        for view in [titleFormContainer, stvContainerTitleField, stvContainerValueField] {
            stvContent.addArrangedSubview(view)
        }

        titleFormContainer.addSubview(lblTitleForm)
        titleFormContainer.addSubview(swActive)
    }

    func makeConstraints() {
        stvContent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        efTitle.snp.makeConstraints { (make) in
            make.height.equalTo(45)
        }

        efValue.snp.makeConstraints { (make) in
            make.height.equalTo(45)
        }

        lblTitleForm.snp.makeConstraints { (make) in
            make.top.bottom.left.equalToSuperview()
        }

        swActive.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(lblTitleForm.snp.right).offset(10)
        }
    }

    func updateModel() {
        guard let model = model else { return }

        efTitle.text = model.title
        efValue.text = model.value
        swActive.setOn(model.isActive, animated: false)
    }
}

extension SettingView: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {

    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let model = model {
            changedValue?(.init(id: model.id,
                                title: efTitle.text ?? "",
                                value: efValue.text ?? ""))
        }
        endEditing?()
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing?()
        return true
    }
}

private extension SettingView {

    private func addShadows() {
        stvContent.layer.borderWidth = 1.0
        stvContent.layer.borderColor = UIColor.clear.cgColor
        stvContent.layer.cornerRadius = 4.0
        stvContent.clipsToBounds = true

        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.7
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds,
                                        cornerRadius: stvContent.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
    }

    func getStackView(views: [UIView]) -> UIStackView {
        let stvView = UIStackView().setupAutoLayout()

        for view in views {
            stvView.addArrangedSubview(view)
        }
        stvView.axis = .vertical
        stvView.distribution = .fill
        stvView.alignment = .fill
        stvView.spacing = 4.0
        return stvView
    }
}
