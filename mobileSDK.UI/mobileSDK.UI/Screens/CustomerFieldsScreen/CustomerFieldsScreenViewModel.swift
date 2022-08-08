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
    override func mapState(from parentState: RootVM.ViewState) throws -> CustomerFieldsScreenState {
        parentState as CustomerFieldsScreenState
    }

    override func mapIntent(from childIntent: CustomerFieldsScreenIntent) throws -> RootVM.UserIntent {
       .customerFieldsScreenIntent(childIntent)
    }
}

extension RootState: CustomerFieldsScreenState {
    var visibleCustomerFields: [CustomerField] {
        return customerFields?.filter { !$0.isHidden } ?? []
    }
}
