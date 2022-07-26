//
//  ValidationService.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 21.07.2022.
//

import Foundation

public protocol ValidationService {
    func isCardHolderNameValid(value: String) -> Bool
    func isPanValidatorValid(value: String) -> Bool
}
