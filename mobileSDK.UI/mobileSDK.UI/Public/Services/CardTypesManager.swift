//
//  CardTypesManager.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 25.07.2022.
//

import Foundation

public protocol CardTypesManager {
    func getCardType(for pan: String) -> PaymentMethodCard?
}

public protocol CardTypesManagerFabric {
    func create(with cardTypes: [PaymentMethodCard]) -> CardTypesManager?
}
