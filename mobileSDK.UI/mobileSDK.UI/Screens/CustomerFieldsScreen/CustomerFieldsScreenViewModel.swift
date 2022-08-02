//
//  CustomerFieldsScreenModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 28.07.2022.
//

import Foundation

protocol CustomerFieldsScreenModelProtocol: ViewModel
where ViewState == CustomerFieldsScreenState, UserIntent == CustomerFieldsScreenIntent {}

class CustomerFieldsScreenModel<RootVM: RootViewModelProtocol>: ChildViewModel<CustomerFieldsScreenState, CustomerFieldsScreenIntent, RootVM>, CustomerFieldsScreenModelProtocol {
}
