//
//  PaymentMethodsScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 27.06.2022.
//

import SwiftUI

struct PaymentMethodsScreen<VM: PaymentMethodsScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM

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
                PaymentDetailsView(details: viewModel.state.paymentOptions.details)
            }.padding([.horizontal, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                PaymentOverview(isVatIncluded: viewModel.state.isVatIncluded,
                                priceValue: viewModel.state.paymentOptions.summary.value,
                                currency: viewModel.state.paymentOptions.summary.currency,
                                backgroundTemplate: UIScheme.infoCardBackground,
                                logoImage: viewModel.state.paymentOptions.summary.logo)
                if let presentationMode = viewModel.state.applePayPresentationMode, presentationMode == .button {
                    ApplePayButton {
                        viewModel.dispatch(intent: .payWithApplePay(customerFields: []))
                    }
                }
                paymentMethodsList
                PolicyView()
                FooterView()
            }
            .padding(.horizontal, UIScheme.dimension.largeSpacing)
            .padding(.top, UIScheme.dimension.middleSpacing)
            .padding(.bottom, UIScheme.dimension.largeSpacing)
        }.onAppear {
            if viewModel.state.applePayPresentationMode == .button
            && viewModel.state.mergedList.compactMap({ $0.paymentMethod}).count == 1 {
                viewModel.dispatch(intent: .payWithApplePay(customerFields: []))
            }
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
                    getPaymentMethodCell(for: savedAccount, isExpanded: expandedListEntryID == listEntity.id) {
                        viewModel.dispatch(intent: .select(listEntity))
                    }
                case .paymentMethod(let method):
                    getPaymentMethodCell(for: method, isExpanded: expandedListEntryID == listEntity.id) {
                        viewModel.dispatch(intent: .select(listEntity))
                    }
                }
            }
        }
    }

    private func getPaymentMethodCell(for method: PaymentMethod,
                                      isExpanded: Bool,
                                      onTap: @escaping () -> Void) -> some View {
        return Group {
            if method.methodType == .applePay && viewModel.state.applePayPresentationMode != .method {
                EmptyView()
            } else {
                PaymentMethodCell(methodTitle: method.displayName ?? method.methodType.rawValue,
                                  methodImage: getLogo(for: method),
                                  isSavedAccount: false,
                                  isExpanded: isExpanded,
                                  content: expandableContent(for: method)) {
                    withAnimation {
                        onTap()
                    }
                }
            }
        }
    }

    private func getPaymentMethodCell(for savedAccount: SavedAccount,
                                      isExpanded: Bool,
                                      onTap: @escaping () -> Void) -> some View {
        return Group {
            PaymentMethodCell(methodTitle: savedAccount.number ?? "***",
                              methodImage: getLogo(for: savedAccount),
                              isSavedAccount: true,
                              isExpanded: isExpanded,
                              content: savedCardView(for: savedAccount)) {
                withAnimation {
                    onTap()
                }
            }
        }
    }

    private func savedCardView(for savedAccount: SavedAccount) -> SavedCardCheckoutView? {
        guard let cardPaymentMethod = viewModel.state.cardPaymentMethod
        else {
            return nil
        }
        return SavedCardCheckoutView(paymentOptions: viewModel.state.paymentOptions,
                                     savedCard: savedAccount,
                                     methodForAccount: cardPaymentMethod) { intent in
            viewModel.dispatch(intent: intent)
        } deleteCardAction: {
            viewModel.dispatch(intent: .delete(savedAccount))
        }
    }

    private func expandableContent(for method: PaymentMethod) -> some View {
        return Group {
            switch method.methodType {
            case .card:
                NewCardCheckoutView(paymentOptions: viewModel.state.paymentOptions, paymentMethod: method) {
                    viewModel.dispatch(intent: $0)
                }
            case .applePay:
                ApplePayCheckoutView(paymentOptions: viewModel.state.paymentOptions, method: method) {
                    viewModel.dispatch(intent: $0)
                }
            default:
                Color.red.frame(height: 10)
            }
        }
    }

    private func getLogo(for method: PaymentMethod) -> some View {
        return Group {
            if let localImage = method.localLogo {
                localImage
            } else {
                method.serverLogo
            }
        }
    }

    private func getLogo(for savedAccount: SavedAccount) -> some View {
        return Group {
            savedAccount.savedAccountCardType.localLogo?
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#if DEBUG

struct PaymentMethodsScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodsScreen(viewModel: PaymentMethodsScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif
