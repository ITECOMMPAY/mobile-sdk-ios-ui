//
//  NavigationComponentViewModel.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation

protocol NavigationComponentViewModelProtocol: ViewModel, RootChild
where ViewState == NavigationComponentState, UserIntent == Void {} // UserIntent == Void т.к. пользователь напрямую с навигацией не взаиможействует

/// Модель компонента навигации. В маппингах с помощью рутового состояния определяется то какой экран сейчас нужно отображать
class NavigationComponentViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<NavigationComponentState, Void, rootVM>, NavigationComponentViewModelProtocol {
    override func mapState(from parentState: rootVM.ViewState) throws -> NavigationComponentState {
        return NavigationComponentState(currentScreen: parentState.currentScreen)
    }
}
