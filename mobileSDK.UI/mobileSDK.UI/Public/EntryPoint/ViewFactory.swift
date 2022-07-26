//
//  ViewFactory.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 07.07.2022.
//

import SwiftUI
import Combine

public struct ViewFactory {
    public static func assemblePaymentMethodsView(staticData: (summary: PaymentSummaryData, details: [PaymentDetailData]),
                                                  initPublisher: AnyPublisher<InitEvent, CoreError>,
                                                  onDismiss completion: @escaping () -> Void) -> some View {
        let viewModel = PaymentMethodsViewModel(staticInfo: staticData, futureData: initPublisher)
        viewModel.dismissCompletion = completion
        let view = PaymentMethodsView(viewModel: viewModel)
        return view
    }
}
