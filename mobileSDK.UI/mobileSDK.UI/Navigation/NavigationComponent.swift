//
//  NavigationComponent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 01.08.2022.
//

import Foundation
import SwiftUI

/// Компонент навигации, на основе своего состояния определяет текущий экран который будет отображён
struct NavigationComponent<ViewModelType: NavigationComponentViewModelProtocol>: View, ViewWithViewModel {
    let viewModel: ViewModelType
    @State var cardShown: Bool = false

    var body: some View {
        BottomCardView(cardShown: cardShown) {
            currentScreen
        }.onAppear {
            cardShown = true
        }
    }

    @ViewBuilder
    private var currentScreen: some View {
        switch viewModel.state.currentScreen {
        case .initialLoading:
            ViewFactory.assembleInitialLoadingScreen(parentModel: viewModel.parentViewModel)
        case .paymentMethods:
            ViewFactory.assemblePaymentMethodsScreen(parentModel: viewModel.parentViewModel)
        case .customerFields:
            EmptyView()
        case .clarificationFields:
            EmptyView()
        case .acsPage:
            EmptyView()
        case .loading:
            EmptyView()
        case .successResult:
            EmptyView()
        case .declineResult:
            EmptyView()
        }
    }
}
