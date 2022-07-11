//
//  ViewFactory.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 07.07.2022.
//

import SwiftUI
import Combine

public struct ViewFactory {
    public static func assemblePaymentMethodsView(futureData: Future<PaymentMethodsData, CoreError>,
                                                  onDismiss completion: @escaping () -> Void) -> some View {
        let viewModel = PaymentMethodsViewModel(futureData: futureData)
        viewModel.dismissCompletion = completion
        let view = PaymentMethodsView(viewModel: viewModel)
        return view
    }
}
