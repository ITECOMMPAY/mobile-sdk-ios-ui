//
//  PaymentMethodsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct PaymentMethodsView<VM: PaymentMethodsViewModelProtocol>: View {
    @ObservedObject var viewModel: VM

    public var body: some View {
        return BottomCardView(cardShown: viewModel.state.isVisible) {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center){
                    ScreenHeader(text: L.title_payment_methods.string)
                    Spacer()
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
                switch viewModel.state {
                case .initial, .loading:
                    loadingStateHeader
                case .loaded, .closed:
                    header
                }
            }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack {
                CompatibleVStack(spacing: UIScheme.dimension.smallSpacing)  {
                    switch viewModel.state {
                    case  .initial, .loading:
                        paymentMethodsPlaceholders
                    case .loaded, .closed:
                        paymentMethodsList
                    }
                    FooterView().padding(.bottom, UIScheme.dimension.largeSpacing)
                }.padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
            }.padding(.top, UIScheme.dimension.middleSpacing)
        }
    }

    @ViewBuilder
    private var loadingStateHeader: some View {
        RedactedView()
            .cornerRadius(UIScheme.dimension.smallestCornerRadius)
            .frame(width: 125, height: 20, alignment: .leading)
        RedactedView()
            .frame(height: 150)
            .cornerRadius(UIScheme.dimension.backgroundSheetCornerRadius)
        HStack {
            ForEach((0..<2), id: \.self)  {_ in
                RedactedView()
                    .cornerRadius(UIScheme.dimension.buttonCornerRadius)
            }
        }.frame(height: UIScheme.dimension.applePayButtonHeight)
    }

    private var paymentMethodsPlaceholders: some View {
        ForEach((0..<6), id: \.self)  {_ in
            RedactedView()
                .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
                .cornerRadius(UIScheme.dimension.buttonCornerRadius)
        }
    }

    @ViewBuilder
    private var header: some View  {
        switch(viewModel.state) {
        case .loaded(data: let data, expanded: _):
            PaymentDetailsView(details: data.paymentDetails)
            PaymentSummaryView(isVatIncluded: data.paymentSummary.isVatIncluded,
                               priceValue: data.paymentSummary.value,
                               currency: data.paymentSummary.currency,
                               backgroundTemplate: .lines,
                               logoImage: data.paymentSummary.logo)
        default:
            EmptyView()
        }
        ApplePayButton()
    }

    @ViewBuilder
    private var paymentMethodsList: some View {
        switch viewModel.state {
        case .loaded(let data, expanded: let expandedMethod):
            ForEach(data.availablePaymentMethods, id: \.id) { method in
                PaymentMethodCell(methodTitle: method.name,
                                  methodImage: nil,
                                  isSavedAccount: false,
                                  isExpanded: expandedMethod?.id == method.id,
                                  content: Color.red.frame(height: 100))
            }
        default:
            EmptyView()
        }
    }


}

#if DEBUG

struct PaymentMethodsView_Previews: PreviewProvider {
    typealias PaymentMethodsPreviewModel = StaticViewModel<PaymentMethodsViewState, PaymentMethodsIntent>

    static let previewModel = PaymentMethodsPreviewModel(
        state: .loading,
        intentReducers: [.close : { _ in return .closed(withError: nil)}]
    )

    static var backgroundAppImitation: some View {
        VStack {
            ForEach((1...50), id: \.self)  {_ in
                Color(red: .random(in: 0...1),
                      green: .random(in: 0...1),
                      blue: .random(in: 0...1),
                      opacity: 1.0)
            }
        }
    }

    static var previews: some View {
        Group {
            ZStack {
                backgroundAppImitation
                PaymentMethodsView(viewModel: previewModel).onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        previewModel.state = .loaded(
                            data: PaymentMethodsData(
                                paymentDetails: [

                                ],
                                paymentSummary: PaymentSummaryData(logo: IR.applePayButtonLogo.image,
                                                                   currency: "RUB",
                                                                   value: 100,
                                                                   isVatIncluded: true),
                                availablePaymentMethods: [
                                    PaymentMethod(id: 1, name: "**** 3456", type: .SavedCard),
                                    PaymentMethod(id: 2, name: "**** 5555", type: .SavedCard),
                                    PaymentMethod(id: 3, name: "Bank Card", type: .Card),
                                    PaymentMethod(id: 4, name: "Apple Pay", type: .ApplePay),
                                ]
                            ),
                            expanded: nil
                        )
                        previewModel.objectWillChange.send()
                    }
                }
            }.edgesIgnoringSafeArea(.vertical)
        }
    }
}

extension PaymentMethodsView_Previews.PaymentMethodsPreviewModel: PaymentMethodsViewModelProtocol {}

#endif



