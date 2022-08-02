//
//  ViewFactory.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 07.07.2022.
//

import SwiftUI
import Combine

public struct ViewFactory {
    public static func assembleRootView(staticData: (summary: PaymentSummaryData, details: [PaymentDetailData]),
                                        initPublisher: AnyPublisher<InitEvent, CoreError>,
                                        onDismiss completion: @escaping () -> Void) -> some View {
        let rootViewModel = RootViewModel(staticInfo: staticData, futureData: initPublisher) { _ in // TODO: Forward finish status
            completion()
        }
        return RootView(viewModel: rootViewModel)
    }

    static func assembleInitialLoadingScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        return InitialLoadingScreen(viewModel: InitialLoadingScreenViewModel(parentViewModel: parentModel))
    }

    static func assemblePaymentMethodsScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        return PaymentMethodsScreen(viewModel: PaymentMethodsScreenViewModel(parentViewModel: parentModel))
    }

    static func assembleCustomerFieldsScreen<Model: RootViewModelProtocol>(parentModel: Model) -> some View {
        return CustomerFieldsScreen(viewModel: CustomerFieldsScreenModel(parentViewModel: parentModel))
    }
}
