//
//  ApplePaySettingView.swift
//  TestClient
//
//  Created by Виталий Морозов on 02.02.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import UIKit
import SnapKit

class ApplePaySettingView: UIView {
    
    let btnApply = UIButton().setupAutoLayout()
    
    var settingsView = [SettingView]()
    private var stvContent = UIStackView().setupAutoLayout()
    private var svContainer = UIScrollView().setupAutoLayout()
    
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
        
        backgroundColor = UIColor.white
        
        stvContent.axis = .vertical
        stvContent.alignment = .fill
        stvContent.distribution = .fill
        stvContent.spacing = 10.0
    
        btnApply.setTitle("SUBMIT", for: .normal)
        btnApply.setTitleColor(UIColor.white, for: .normal)
        btnApply.backgroundColor = UIColor.systemBlue
        btnApply.layer.cornerRadius = 10.0
    }
    
    private func addSubviews() {
        addSubview(svContainer)
        addSubview(btnApply)
        svContainer.addSubview(stvContent)
    }
    
    private func makeConstraints() {
        svContainer.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(15)
            if #available(iOS 11.0, *) {
                make.top.equalTo(safeAreaLayoutGuide).offset(30)
            } else {
                make.top.equalToSuperview().offset(70)
            }
            make.bottom.equalTo(btnApply.snp.top).offset(-15)
        }
        
        stvContent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        btnApply.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(45)
            make.height.equalTo(40)
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(safeAreaLayoutGuide).offset(-30)
            } else {
                make.bottom.equalToSuperview().offset(-30)
            }
        }
    }
    
    func generateSettingViews(models: [SettingView.Model],
                              completion: @escaping (SettingView.ChangedValue) -> ()){
        stvContent.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        models.forEach { model in
            let view = SettingView().setupAutoLayout()
            view.model = model
            view.changedValue = completion
            stvContent.addArrangedSubview(view)
        }
    }
}
