//
//  PaymentMethodsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 27.06.2022.
//

import SwiftUI

struct PaymentMethodsView<VM: PaymentMethodsViewModelProtocol>: View {
    @ObservedObject var viewModel: VM
    @State private var expandedListEntryID: String?

    public var body: some View {
        return BottomCardView(cardShown: viewModel.state.isVisible) {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: L.title_payment_methods.string)
                    Spacer()
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
                header
            }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: .zero) {
                switch viewModel.state {
                case  .initial, .loading:
                    paymentMethodsPlaceholders
                case .loaded(let data):
                    PaymentSummaryView(isVatIncluded: data.paymentSummary.isVatIncluded,
                                       priceValue: data.paymentSummary.value,
                                       currency: data.paymentSummary.currency,
                                       backgroundTemplate: UIScheme.infoCardBackground,
                                       logoImage: data.paymentSummary.logo)
                    ApplePayButton().padding([.top, .bottom], UIScheme.dimension.middleSpacing)
                    paymentMethodsList
                    PolicyView()
                        .padding(.top, UIScheme.dimension.middleSpacing)
                    FooterView()
                        .padding(.bottom, UIScheme.dimension.largeSpacing)
                case .closed:
                    EmptyView()
                }
            }
            .padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
            .padding(.top, UIScheme.dimension.middleSpacing)
        }
        .alert(isPresented: .constant(alert != nil)) {
            alert!
        }
    }

    private var alert: Alert? {
        switch viewModel.state {
        case .closed(let error):
            guard let error = error else { return nil }
            return Alert(title: Text(error.code.rawValue),
                         message: Text(error.message),
                         dismissButton: Alert.Button.default(Text("Close")))
        default:
            return nil

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
    private var header: some View {
        switch viewModel.state {
        case .loaded(data: let data):
            PaymentDetailsView(details: data.paymentDetails)
        case .loading, .initial:
            loadingStateHeader
        case .closed:
            EmptyView()
        }
    }

    @ViewBuilder
    private var paymentMethodsList: some View {
        switch viewModel.state {
        case .loaded(let state):
            VStack(spacing: UIScheme.dimension.smallSpacing) {
                ForEach(state.mergedList, id: \.id) { listEtity in
                    switch listEtity.entityType {
                    case .savedAccount(let savedAccount):
                        PaymentMethodCell(methodTitle: savedAccount.number ?? "***",
                                          methodImage: nil,
                                          isSavedAccount: true,
                                          isExpanded: expandedListEntryID == listEtity.id,
                                          content: savedCardView(for: savedAccount)) {
                            withAnimation {
                                expandedListEntryID = listEtity.id
                            }
                        }
                    case .paymentMethod(let method):
                        PaymentMethodCell(methodTitle: method.name ?? method.methodType.rawValue,
                                          methodImage: nil,
                                          isSavedAccount: false,
                                          isExpanded: expandedListEntryID == listEtity.id,
                                          content: expandableContent(for: method)) {
                            withAnimation {
                                expandedListEntryID = listEtity.id
                            }
                        }
                    }
                }
            }
        default:
            EmptyView()
        }
    }

    func savedCardView(for savedAccount: SavedAccount)  -> some View {
        Group {
            if let loadedState = viewModel.state.loadedState {
                SavedCardCheckoutView(paymentAmount: loadedState.paymentSummary.value, paymentCurrency: loadedState.paymentSummary.currency, savedCard: savedAccount) {cvvText in
                    viewModel.dispatch(intent: .paySavedAccountWith(id: savedAccount.id, cvv: cvvText))
                } deleteCardAction: {
                    // TODO: Implement later
                }
            } else {
                EmptyView()
            }
        }
    }

    private func expandableContent(for method: PaymentMethod) -> some View {
        return Group {
            switch method.methodType {
            case .card:
                if  let loadedState = viewModel.state.loadedState {
                    NewCardCheckoutView(paymentMethod: method,
                                        paymentAmount: loadedState.paymentSummary.value,
                                        paymentCurrency: loadedState.paymentSummary.currency) {
                        viewModel.dispatch(intent: $0)
                    }
                } else {
                        EmptyView()
                }

            case .applePay:
                ApplePayCheckoutView()
            default:
                Color.red.frame(height: 10)
            }
        }
    }
}

private struct PaymentMethodsListEntity {
    let entityType: PaymentMethodsListEntityType
    var id: String {
        switch entityType {
        case .savedAccount(let savedAccount):
            return String(savedAccount.id)
        case .paymentMethod(let paymentMethod):
            return paymentMethod.methodType.rawValue + (paymentMethod.name ?? "")
        }
    }
}

private enum PaymentMethodsListEntityType {
    case savedAccount(SavedAccount)
    case paymentMethod(PaymentMethod)
}

private extension PaymentMethodsLoadedState {
    var mergedList: [PaymentMethodsListEntity] {
        self.savedAccounts.map {  PaymentMethodsListEntity(entityType: .savedAccount($0))  }
        + self.availablePaymentMethods.map { PaymentMethodsListEntity(entityType: .paymentMethod($0)) }
    }
}

#if DEBUG

struct PaymentMethodsView_Previews: PreviewProvider {
    /*
    typealias PaymentMethodsPreviewModel = StaticViewModel<PaymentMethodsViewState, PaymentMethodsIntent>

     static let previewModel = PaymentMethodsPreviewModel(
     state: .initial,
     intentReducers: [.close : { _ in return .closed(withError: nil)}]
     )
     */
    static var backgroundAppImitation: some View {
        VStack {
            ForEach((1...50), id: \.self) {_ in
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
                // TODO: Repair preview
                /*
                 PaymentMethodsView(viewModel: previewModel).onAppear {
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
