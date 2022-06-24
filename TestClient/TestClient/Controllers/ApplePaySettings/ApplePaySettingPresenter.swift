//
//  ApplePaySettingPresenter.swift
//  TestClient
//
//  Created by Виталий Морозов on 02.02.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import Foundation

protocol ApplePaySettingPresenterProtocol {
    
    func onSubmit()
    func changedValue(id: String, title: String, value: String)
    func finish()
    func addNewField()
}

class ApplePaySettingPresenter: ApplePaySettingPresenterProtocol {

    private var models: [SettingView.Model] = [] {
        didSet {
            view.setupFields(models: models)
        }
    }
    
    private let view: ApplePaySettingViewControllerProtocol
    
    required init(view: ApplePaySettingViewControllerProtocol) {
        self.view = view
    }
    
    func onSubmit() {
        view.onFinish(models: models)
    }
    
    func changedValue(id: String, title: String, value: String) {
        models = models.map { model in
            var copy = model
            if model.id == id {
                copy.title = title
                copy.value = value
            }
            return copy
        }
    }
    
    func finish() {
        
    }
    
    func addNewField() {
        let uniqueId = UUID().uuidString
        models.append(.init(id: uniqueId,
                            title: "",
                            value: "",
                            isActive: true))
    }
}
