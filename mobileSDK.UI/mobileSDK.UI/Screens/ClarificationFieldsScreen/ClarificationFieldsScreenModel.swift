//
//  ClarificationFieldsScreenModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 09.08.2022.
//

import Foundation

protocol ClarificationFieldsScreenModelProtocol: ViewModel
where ViewState == ClarificationFieldsScreenState, UserIntent == ClarificationFieldsScreenIntent {}

class ClarificationFieldsScreenModel<RootVM: RootViewModelProtocol>: ChildViewModel<ClarificationFieldsScreenState, ClarificationFieldsScreenIntent, RootVM>, ClarificationFieldsScreenModelProtocol {
    override func mapState(from parentState: RootVM.ViewState) throws -> ClarificationFieldsScreenState {
        parentState as ClarificationFieldsScreenState
    }

    override func mapIntent(from childIntent: ClarificationFieldsScreenIntent) throws -> RootVM.UserIntent {
        .clarificationFieldsScreenIntent(childIntent)
    }
}

extension RootState: ClarificationFieldsScreenState {}
