//
//  ViewFactory.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 07.07.2022.
//

import SwiftUI
import Combine

public struct ViewFactory {
    public static func assembleRootView(paymentOptions: PaymentOptions,
                                        initPublisher: AnyPublisher<InitEvent, CoreError>,
                                        onDismiss completion: @escaping PaymentFlowDismisedCompletion) -> some View {
        let rootViewModel = RootViewModel(paymentOptions: paymentOptions, futureData: initPublisher, onFlowFinished: completion)
        return RootView(viewModel: rootViewModel).edgesIgnoringSafeArea(.all)
    }

    internal static func assembleInitialLoadingScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        return InitialLoadingScreen(viewModel: InitialLoadingScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assemblePaymentMethodsScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        return PaymentMethodsScreen(viewModel: PaymentMethodsScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assembleCustomerFieldsScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        return CustomerFieldsScreen(viewModel: CustomerFieldsScreenModel(parentViewModel: parentModel))
    }
}
