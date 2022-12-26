//
//  NavigationComponentViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

protocol RootChild {
    associatedtype ParentViewModel: RootViewModelProtocol
    var parentViewModel: ParentViewModel { get }
}

enum NavigationComponentIntent {
    case close
}

protocol NavigationComponentViewModelProtocol: ViewModel, RootChild
where ViewState == NavigationComponentState, UserIntent == NavigationComponentIntent {}

/// Модель компонента навигации. В маппингах с помощью рутового состояния определяется то какой экран сейчас нужно отображать
class NavigationComponentViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<NavigationComponentState, NavigationComponentIntent, rootVM>, NavigationComponentViewModelProtocol {
    override func mapState(from parentState: rootVM.ViewState) throws -> NavigationComponentState {
        return NavigationComponentState(currentScreen: parentState.currentScreen)
    }
    
    override func mapIntent(from childIntent: NavigationComponentIntent) throws -> rootVM.UserIntent {
        .navigationIntent(.close)
    }
}
