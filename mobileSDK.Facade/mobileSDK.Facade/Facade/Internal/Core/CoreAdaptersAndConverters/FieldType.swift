//
//  FieldType.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 29.07.2022.
//

import Foundation

#if !DEVELOPMENT
internal import MsdkCore
internal import mobileSDK_UI
#else
import MsdkCore
import mobileSDK_UI
#endif

extension mobileSDK_UI.FieldServerType {
    static func createFrom(code: MsdkCore.FieldServerType) -> mobileSDK_UI.FieldServerType {
        if code ==  MsdkCore.FieldServerType.text { return .text }
        if code ==  MsdkCore.FieldServerType.tel { return .tel }
        if code ==  MsdkCore.FieldServerType.password { return .password }
        if code ==  MsdkCore.FieldServerType.file { return .file }
        if code ==  MsdkCore.FieldServerType.textarea { return .textarea }
        if code ==  MsdkCore.FieldServerType.number { return .number }
        if code ==  MsdkCore.FieldServerType.search { return .search }
        if code ==  MsdkCore.FieldServerType.url { return .url }
        if code ==  MsdkCore.FieldServerType.email { return .email }
        if code ==  MsdkCore.FieldServerType.date { return .date }
        return .text
    }
}
