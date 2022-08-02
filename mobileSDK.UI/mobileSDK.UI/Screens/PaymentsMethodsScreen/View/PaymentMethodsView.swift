//
//  PaymentMethodsScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct PaymentMethodsScreen<VM: PaymentMethodsScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM
    @State var customerFieldValues: [CustomerFieldValue] = []

    private var expandedListEntryID: String? {
        return viewModel.state.selectedPaymentMethod?.id
    }

    public var body: some View {
        return BottomCardViewContent {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: L.title_payment_methods.string)
                    Spacer()
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
                PaymentDetailsView(details: viewModel.state.paymentDetails)
            }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: .zero) {
                PaymentSummaryView(isVatIncluded: viewModel.state.isVatIncluded,
                                   priceValue: viewModel.state.paymentSummary.value,
                                   currency: viewModel.state.paymentSummary.currency,
                                       backgroundTemplate: UIScheme.infoCardBackground,
                                   logoImage: viewModel.state.paymentSummary.logo)
                    ApplePayButton().padding([.top, .bottom], UIScheme.dimension.middleSpacing)
                    paymentMethodsList
                    PolicyView()
                        .padding(.top, UIScheme.dimension.middleSpacing)
                    FooterView()
                        .padding(.bottom, UIScheme.dimension.largeSpacing)

            }
            .padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
            .padding(.top, UIScheme.dimension.middleSpacing)
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
            ForEach((0..<2), id: \.self) {_ in
                RedactedView()
                    .cornerRadius(UIScheme.dimension.buttonCornerRadius)
            }
        }.frame(height: UIScheme.dimension.applePayButtonHeight)
    }

    private var paymentMethodsPlaceholders: some View {
        VStack(spacing: UIScheme.dimension.smallSpacing) {
            ForEach((0..<6), id: \.self) {_ in
                RedactedView()
                    .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
                    .cornerRadius(UIScheme.dimension.buttonCornerRadius)
            }
        }
    }

    @ViewBuilder
    private var paymentMethodsList: some View {
        VStack(spacing: UIScheme.dimension.smallSpacing) {
            ForEach(viewModel.state.mergedList, id: \.id) { listEntity in
                switch listEntity.entityType {
                case .savedAccount(let savedAccount):
                    PaymentMethodCell(methodTitle: savedAccount.number ?? "***",
                                      methodImage: nil,
                                      isSavedAccount: true,
                                      isExpanded: expandedListEntryID == listEntity.id,
                                      content: savedCardView(for: savedAccount)) {
                        withAnimation {
                            viewModel.dispatch(intent: .select(listEntity))
                        }
                    }
                case .paymentMethod(let method):
                    PaymentMethodCell(methodTitle: method.name ?? method.methodType.rawValue,
                                      methodImage: nil,
                                      isSavedAccount: false,
                                      isExpanded: expandedListEntryID == listEntity.id,
                                      content: expandableContent(for: method)) {
                        withAnimation {
                            viewModel.dispatch(intent: .select(listEntity))
                        }
                    }
                }
            }
        }
    }

    func savedCardView(for savedAccount: SavedAccount)  -> some View {
        SavedCardCheckoutView(paymentAmount: viewModel.state.paymentSummary.value, paymentCurrency: viewModel.state.paymentSummary.currency, savedCard: savedAccount, additionalFieldsView: additionalFieldsView, payButtonLabelStyle: payButtonLabelStyle) {cvvText in
            if !viewModel.state.isContinueButton {
                viewModel.dispatch(intent: .paySavedAccountWith(id: savedAccount.id, cvv: cvvText))
            } else {
                viewModel.dispatch(intent: .continueToCustomerScreen)
            }
        } deleteCardAction: {
            viewModel.dispatch(intent: .delete(savedAccount))
        }
    }

    var payButtonLabelStyle: PayButtonLabel.Style {
        viewModel.state.isContinueButton
        ? .Continue
        : .Pay( viewModel.state.paymentSummary.value, currency: viewModel.state.paymentSummary.currency)
    }

    private func expandableContent(for method: PaymentMethod) -> some View {
        return Group {
            switch method.methodType {
            case .card:
                    NewCardCheckoutView(paymentMethod: method,
                                        paymentAmount: viewModel.state.paymentSummary.value,
                                        paymentCurrency: viewModel.state.paymentSummary.currency,
                    additionalFieldsView: additionalFieldsView) {
                        viewModel.dispatch(intent: $0)
                    }
            case .applePay:
                ApplePayCheckoutView(additionalFieldsView: additionalFieldsView)
            default:
                Color.red.frame(height: 10)
            }
        }
    }

    private var additionalFieldsView: EmbeddedFieldView? {
        let customerFields = viewModel.state.visibleCustomerFields
        guard customerFields.count > 0 && customerFields.count < 3 else {
            return nil
        }
        return EmbeddedFieldView(visibleCustomerFields: customerFields, customerFieldValues: .constant([]), isValid: .constant(false))
    }
}

#if DEBUG

import Combine

struct PaymentMethodsScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                // TODO: Repair preview
                /*
                 PaymentMethodsScreen(viewModel: previewModel).onAppear {
                 previewModel.state = .loading
                 DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                 previewModel.state = .loaded(
                 data: PaymentMethodsData(
                 paymentDetails: [
                 PaymentDetailData(title: "PaymentID", description: "123", canBeCopied: true)
                 ],
                 paymentSummary: PaymentSummaryData(logo: IR.applePayButtonLogo.image,
                 currency: "RUB",
                 value: 100,
                 isVatIncluded: true),
                 availablePaymentMethods: [
                 PaymentMethod(id: 1, name: "**** 3456", type: .SavedCard),
                 PaymentMethod(id: 2, name: "**** 5555", type: .SavedCard),
                 PaymentMethod(id: 3, name: "Bank Card", type: .NewCard),
                 PaymentMethod(id: 4, name: "Apple Pay", type: .ApplePay),
                 ]
                 )
                 )
                 }
                 }
                 */
            }.edgesIgnoringSafeArea(.vertical)
        }
    }
}

#endif
