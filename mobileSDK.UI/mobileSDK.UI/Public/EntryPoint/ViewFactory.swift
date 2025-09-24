//
//  ViewFactory.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 07.07.2022.
//

import SwiftUI
import Combine

public struct ViewFactory {
    public static func assembleRootView(
        paymentOptions: PaymentOptions,
        initPublisher: AnyPublisher<InitEvent, CoreError>,
        onDismiss completion: @escaping PaymentFlowCompletion
    ) -> some View {
        serviceLocator.addService(instance: TranslationsManager())

        if paymentOptions.isDarkThemeOn {
            UIScheme.color = DefaultDark(
                primaryBrandColor: paymentOptions.primaryBrandColorOverride,
                secondaryBrandColor: paymentOptions.secondaryBrandColorOverride
            )
        } else {
            UIScheme.color = DefaultLight(
                primaryBrandColor: paymentOptions.primaryBrandColorOverride,
                secondaryBrandColor: paymentOptions.secondaryBrandColorOverride
            )
        }

        let rootViewModel = RootViewModel(paymentOptions: paymentOptions, futureData: initPublisher, onFlowFinished: completion)
        return RootView(viewModel: rootViewModel).ignoresSafeArea(.all, edges: .all)
    }

    internal static func assembleInitialLoadingScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        InitialLoadingScreen(viewModel: InitialLoadingScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assemblePaymentMethodsScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        PaymentMethodsScreen(viewModel: PaymentMethodsScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assembleCustomerFieldsScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        CustomerFieldsScreen(viewModel: CustomerFieldsScreenModel(parentViewModel: parentModel))
    }

    internal static func assembleClarificationFieldsScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        ClarificationFieldsScreen(viewModel: ClarificationFieldsScreenModel(parentViewModel: parentModel))
    }

    internal static func assembleLoadingScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        LoadingScreen(viewModel: LoadingScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assembleThreeDSPageScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        ThreeDSecureScreen(viewModel: ThreeDSecureScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assembleAPSPageScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        ApsScreen(viewModel: ApsScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assembleFinalSuccessScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        ResultSuccessScreen(viewModel: ResultSuccessScreenViewModel(parentViewModel: parentModel))
    }

    internal static func assembleFinalDeclineScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        ResultDeclineScreen(viewModel: ResultDeclineScreenViewModel(parentViewModel: parentModel))
    }

}
