//
//  NavigationComponent.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 01.08.2022.
//

import Foundation
import SwiftUI

/// Компонент навигации, на основе своего состояния определяет текущий экран который будет отображён
struct NavigationComponent<ViewModelType: NavigationComponentViewModelProtocol>: View, ViewWithViewModel {
    let viewModel: ViewModelType
    @State var cardShown: Bool = false

    var body: some View {
        BottomCardView(
            cardShown: cardShown,
            dissmissClosure: {
                viewModel.dispatch(intent: .close)
            }
        ) {
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
            ViewFactory.assembleCustomerFieldsScreen(parentModel: viewModel.parentViewModel)
        case .clarificationFields:
            ViewFactory.assembleClarificationFieldsScreen(parentModel: viewModel.parentViewModel)
        case .threeDSecurePage:
            ViewFactory.assembleThreeDSPageScreen(parentModel: viewModel.parentViewModel)
        case .apsPage:
            ViewFactory.assembleAPSPageScreen(parentModel: viewModel.parentViewModel)
        case .loading:
            ViewFactory.assembleLoadingScreen(parentModel: viewModel.parentViewModel)
        case .successResult:
            ViewFactory.assembleFinalSuccessScreen(parentModel: viewModel.parentViewModel)
        case .declineResult:
            ViewFactory.assembleFinalDeclineScreen(parentModel: viewModel.parentViewModel)
        case .none:
            EmptyView()
        }
    }
}
