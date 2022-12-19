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
        return viewModel.state.selectedMethodsListEntity?.id
    }
    
    private var screenTitle: String {
        switch viewModel.state.paymentOptions.action {
        case .Tokenize:
            return L.button_tokenize.string
        default:
            return L.title_payment_methods.string
        }
    }

    public var body: some View {
        return BottomCardViewContent {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: screenTitle)
                    Spacer()
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
            }.padding([.horizontal, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                if viewModel.state.paymentOptions.action != .Tokenize {
                    PaymentOverview(isVatIncluded: viewModel.state.isVatIncluded,
                                    priceValue: viewModel.state.paymentOptions.summary.value,
                                    currency: viewModel.state.paymentOptions.summary.currency,
                                    paymentDetails: viewModel.state.paymentOptions.details,
                                    backgroundTemplate: UIScheme.infoCardBackground,
                                    logoImage: viewModel.state.paymentOptions.summary.logo)
                    if let presentationMode = viewModel.state.applePayPresentationMode, presentationMode == .button {
                        ApplePayButton {
                            viewModel.dispatch(intent: .payWithApplePay(customerFields: []))
                        }
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
                    getPaymentMethodCell(
                        for: savedAccount,
                        isExpanded: expandedListEntryID == listEntity.id,
                        isCollapsible: viewModel.state.mergedList.count > 1
                    ) {
                        viewModel.dispatch(intent: .select(listEntity))
                    }
                case .paymentMethod(let method):
                    getPaymentMethodCell(
                        for: method,
                        isExpanded: expandedListEntryID == listEntity.id,
                        isCollapsible: viewModel.state.mergedList.count > 1
                    ) {
                        viewModel.dispatch(intent: .select(listEntity))
                    }
                }
            }
        }
    }

    private func getPaymentMethodCell(for method: PaymentMethod,
                                      isExpanded: Bool,
                                      isCollapsible: Bool,
                                      onTap: @escaping () -> Void) -> some View {
        return Group {
            if method.methodType == .applePay && viewModel.state.applePayPresentationMode != .method {
                EmptyView()
            } else {
                PaymentMethodCell(
                    methodTitle: method.displayName ?? method.methodType.rawValue,
                    methodImage: getLogo(for: method),
                    isSavedAccount: false,
                    isExpanded: isExpanded,
                    isCollapsible: isCollapsible,
                    hasHeader: viewModel.state.paymentOptions.action != .Tokenize,
                    content: expandableContent(for: method)
                ) {
                    withAnimation {
                        onTap()
                    }
                }
            }
        }
    }

    private func getPaymentMethodCell(for savedAccount: SavedAccount,
                                      isExpanded: Bool,
                                      isCollapsible: Bool,
                                      onTap: @escaping () -> Void) -> some View {
        return Group {
            PaymentMethodCell(methodTitle: savedAccount.number ?? "***",
                              methodImage: getLogo(for: savedAccount),
                              isSavedAccount: true,
                              isExpanded: isExpanded,
                              isCollapsible: isCollapsible,
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
        let formValuesBinding = Binding(get: {
            viewModel.state.selectedMethodValues ?? .init()
        }, set: {
            viewModel.dispatch(intent: .store($0))
        })
        return SavedCardCheckoutView(
            formValues: formValuesBinding,
            paymentOptions: viewModel.state.paymentOptions,
            savedCard: savedAccount,
            methodForAccount: cardPaymentMethod
        ) { intent in
            viewModel.dispatch(intent: intent)
        }
    }

    private func expandableContent(for method: PaymentMethod) -> some View {
        let formValuesBinding = Binding(get: {
            viewModel.state.selectedMethodValues ?? .init()
        }, set: {
            viewModel.dispatch(intent: .store($0))
        })
        return Group {
            switch method.methodType {
            case .card:
                if viewModel.state.paymentOptions.action == .Tokenize {
                    TokenizeCardView(
                        formValues: formValuesBinding,
                        paymentOptions: viewModel.state.paymentOptions,
                        paymentMethod: method
                    ) {
                        viewModel.dispatch(intent: $0)
                    }
                } else {
                    NewCardCheckoutView(
                        formValues: formValuesBinding,
                        paymentOptions: viewModel.state.paymentOptions,
                        paymentMethod: method
                    ) {
                        viewModel.dispatch(intent: $0)
                    }
                }
            case .applePay:
                ApplePayCheckoutView(
                    formValues: formValuesBinding,
                    paymentOptions: viewModel.state.paymentOptions,
                    paymentMethod: method) {
                    viewModel.dispatch(intent: $0)
                }
            case .aps:
                ApsCheckoutView(paymentOptions: viewModel.state.paymentOptions, paymentMethod: method) {
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
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(UIScheme.color.brandColor)
            } else {
                AsyncImage(url: method.iconUrl.flatMap { URL(string: $0) }) { image in
                    image
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    IR.defaultApsLogo.image?
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }.foregroundColor(UIScheme.color.brandColor)
            }
        }
    }

    private func getLogo(for savedAccount: SavedAccount) -> some View {
        return Group {
            savedAccount.savedAccountCardType.localSavedCardLogo?
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
