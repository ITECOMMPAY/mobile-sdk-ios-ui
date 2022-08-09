//
//  Fabric.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

import Foundation

public protocol CardExpiryFabric {
    func createCardExpiry(with string: String) -> CardExpiry
}
