//
//  CustomerFieldsScreenIntent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.07.2022.
//

import Foundation

enum CustomerFieldsScreenIntent {
    case close
    case back
    case sendCustomerFields([FieldValue])
    case store([FieldValue])
}
