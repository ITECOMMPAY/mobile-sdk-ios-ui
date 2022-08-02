//
//  FieldType.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivev on 29.07.2022.
//

import Foundation

import MsdkCore
import mobileSDK_UI

extension mobileSDK_UI.FieldType {
    static func createFrom(code: MsdkCore.FieldType) -> mobileSDK_UI.FieldType {
        if code == MsdkCore.FieldType.unknown { return .unknown }
        if code == MsdkCore.FieldType.customerEmail { return .customerEmail }
        if code == MsdkCore.FieldType.customerZip { return .customerZip }
        if code == MsdkCore.FieldType.customerPostCode { return .customerPostCode }
        if code == MsdkCore.FieldType.customerAddress { return .customerAddress }
        if code == MsdkCore.FieldType.customerStreetAddress { return .customerStreetAddress }
        if code == MsdkCore.FieldType.customerCountry { return .customerCountry }
        if code == MsdkCore.FieldType.customerFirstName { return .customerFirstName }
        if code == MsdkCore.FieldType.customerMiddleName { return .customerMiddleName }
        if code == MsdkCore.FieldType.customerLastName { return .customerLastName }
        if code == MsdkCore.FieldType.customerPhone { return .customerPhone }
        if code == MsdkCore.FieldType.customerState { return .customerState }
        if code == MsdkCore.FieldType.customerCity { return .customerCity }
        if code == MsdkCore.FieldType.customerDayOfBirth { return .customerDayOfBirth }
        if code == MsdkCore.FieldType.customerBirthPlace { return .customerBirthPlace }
        if code == MsdkCore.FieldType.customerSsn { return .customerSsn }
        if code == MsdkCore.FieldType.customerDomain { return .customerDomain }
        if code == MsdkCore.FieldType.customerMir { return .customerMir }
        if code == MsdkCore.FieldType.customerAccountId { return .customerAccountId }
        if code == MsdkCore.FieldType.customerLanguage { return .customerLanguage }
        if code == MsdkCore.FieldType.customerScreenRes { return .customerScreenRes }
        if code == MsdkCore.FieldType.customerSave { return .customerSave }
        if code == MsdkCore.FieldType.billingPostal { return .billingPostal }
        if code == MsdkCore.FieldType.billingCountry { return .billingCountry }
        if code == MsdkCore.FieldType.billingRegion { return .billingRegion }
        if code == MsdkCore.FieldType.billingCity { return .billingCity }
        if code == MsdkCore.FieldType.billingAddress { return .billingAddress }
        if code == MsdkCore.FieldType.identifyDocNumber { return .identifyDocNumber }
        if code == MsdkCore.FieldType.identifyDocType { return .identifyDocType }
        if code == MsdkCore.FieldType.identifyDocIssueDate { return .identifyDocIssueDate }
        if code == MsdkCore.FieldType.identifyDocIssueBy { return .identifyDocIssueBy }
        if code == MsdkCore.FieldType.custom { return .custom }
        if code == MsdkCore.FieldType.dokuCustomerEmail { return .dokuCustomerEmail }
        if code == MsdkCore.FieldType.dokuCustomerFirstName { return .dokuCustomerFirstName }
        if code == MsdkCore.FieldType.qiwiAccountNumber { return .qiwiAccountNumber }
        if code == MsdkCore.FieldType.netellerAccountNumber { return .netellerAccountNumber }
        if code == MsdkCore.FieldType.netellerSecurityCode { return .netellerSecurityCode }
        if code == MsdkCore.FieldType.webmoneyAccountType { return .webmoneyAccountType }
        if code == MsdkCore.FieldType.webmoneyAccountNumber { return .webmoneyAccountNumber }
        return .unknown
    }
}

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
