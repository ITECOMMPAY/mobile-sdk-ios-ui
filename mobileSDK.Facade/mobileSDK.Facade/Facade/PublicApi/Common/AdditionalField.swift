//
//  AdditionalField.swift
//  ecommpaySDK
//
//  Created by Deniss Kaibagarovs on 03/05/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//
#if !DEVELOPMENT
internal import MsdkCore
#else
import MsdkCore
#endif
import Foundation

public class AdditionalField: NSObject {

    // MARK: - Variables

    public var type: AdditionalFieldType
    @objc public var value: String = ""
    @objc var serverName: String = ""

    // MARK: - Initialisation
    /// - Parameters:
    ///   - type:  Type of additional field, one of AdditionalFieldType
    ///   - value: Known value of the field
    @objc(initWithType:value:)
    public init(type: AdditionalFieldType,
                value: String) {
        self.type = type
        self.value = value
    }

    @objc(initWithCustomName:value:)
    /// - Parameters:
    ///   - customName: Custom field key
    ///   - value: Known value of the field
    public init(customName: String,
                value: String) {
        self.type = .custom
        self.serverName = customName
        self.value = value
    }
}
