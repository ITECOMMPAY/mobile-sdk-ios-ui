//
//  DebugViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.07.2022.
//

import Foundation

#if DEBUG
/// convenience class for using with previews
class StaticViewModel<ViewState, UserIntent: Hashable>: ViewModel {
    var state: ViewState {
        willSet {
            objectWillChange.send()
        }
    }
    typealias Reducer = (ViewState) -> (ViewState)
    private var intentReducerMap: [UserIntent : Reducer]

    init(state: ViewState, intentReducers: [UserIntent : Reducer] = [:]) {
        self.state = state
        self.intentReducerMap = intentReducers
    }

    func dispatch(intent: UserIntent) {
        state = intentReducerMap[intent]?(self.state) ?? state
    }
}

#endif
