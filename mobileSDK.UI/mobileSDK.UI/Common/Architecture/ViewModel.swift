//
//  ViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.07.2022.
//

import Foundation
import Combine

protocol ViewWithViewModel {
    associatedtype ViewModelType
    var viewModel: ViewModelType { get }
}

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

class ChildViewModel<ViewState, UserIntent, ParentViewModel: ViewModel>: ObservableObject, ViewModel {
    typealias ViewState = ViewState
    typealias UserIntent = UserIntent

    let parentViewModel: ParentViewModel
    var state: ViewState {
        do {
            return try mapState(from: parentViewModel.state)
        } catch {
            assertionFailure("state mapping not implemented")
            abort()
        }
    }

    // MARK: private
    private var cancellable: Set<AnyCancellable> = []

    // MARK: Life cycle
    init(parentViewModel: ParentViewModel) {
        self.parentViewModel = parentViewModel
        parentViewModel.objectWillChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.objectWillChange.send()
            })
            .store(in: &cancellable)
    }

    func dispatch(intent: UserIntent) {
        do {
            parentViewModel.dispatch(intent: try mapIntent(from: intent))
        } catch {
            assertionFailure("state mapping not implemented")
        }
    }

    func mapState(from parentState: ParentViewModel.ViewState) throws -> ViewState {
        abort()
        // Overridable method
    }

    func mapIntent(from childIntent: UserIntent) throws -> ParentViewModel.UserIntent {
        abort()
        // Overridable method
    }
}
