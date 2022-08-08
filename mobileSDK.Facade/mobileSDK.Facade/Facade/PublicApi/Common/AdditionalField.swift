//
//  AdditionalField.swift
//  ecommpaySDK
//
//  Created by Deniss Kaibagarovs on 03/05/2019.
//  Copyright © 2019 Ecommpay. All rights reserved.
//
import MsdkCore

public class AdditionalField: NSObject {

    // MARK: - Variables

    public var type: AdditionalFieldType
    @objc public var value: String = ""
    @objc var serverName: String = ""

    // MARK: - Initialisation
    public init(type: AdditionalFieldType,
                value: String) {
        self.type = type
        self.value = value
    }

    @objc(initWithType:value:)
    /// - Parameters:
    ///   - type:  Type of additional field, one of AdditionalFieldType
    ///   - value: Known value of the field
    public init(fieldType: MsdkCore.FieldType,
                value: String) {
        self.type = AdditionalFieldType.createFrom(code: fieldType)
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
