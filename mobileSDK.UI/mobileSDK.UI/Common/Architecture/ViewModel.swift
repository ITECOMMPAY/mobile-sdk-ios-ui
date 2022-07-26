//
//  ViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 05.07.2022.
//

import Foundation

protocol ViewModel: ObservableObject {
    /// Is immutable datatype that completely describes state of the view
    associatedtype ViewState
    /// type describes the current intent of the user
    associatedtype UserIntent
    /// function of handling user intents
    func dispatch(intent: UserIntent)
    /// property holds state
    var state: ViewState { get }
}
