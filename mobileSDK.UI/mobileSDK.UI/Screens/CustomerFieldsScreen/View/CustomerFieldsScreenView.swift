//
//  CustomerFieldsScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 28.07.2022.
//

import SwiftUI

struct CustomerFieldsScreen<VM: CustomerFieldsScreenModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM
    @State var isValid: Bool = false

    var customerFieldValues: [FieldValue] {
        viewModel.state.customerFieldsValues
    }

    var body: some View {
        BottomCardViewContent {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: L.title_payment_additional_data.string)
                    Spacer()
                    BackButton {
                        viewModel.dispatch(intent: .back)
                    }.padding(.trailing)
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
            }.padding([.horizontal, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                overviewView
                if viewModel.state.paymentOptions.action != .Tokenize {
                    Text(L.title_payment_additional_data_disclaimer.string)
                        .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                        .foregroundColor(UIScheme.color.text)
                        .fixedSize(horizontal: false, vertical: true)
                }
                EmbeddedCustomerFieldsView(
                    visibleCustomerFields: viewModel.state.visibleCustomerFields,
                    additionalFields: viewModel.state.paymentOptions.uiAdditionalFields,
                    customerFieldValues: customerFieldValues
                ) { customerFieldValues, isValid in
                    viewModel.dispatch(intent: .store(customerFieldValues))
                    self.isValid = isValid
                }
                PayButton(
                    label: buttonLabel,
                    disabled: !isValid
                ) {
                    viewModel.dispatch(intent: .sendCustomerFields(customerFieldValues))
                }
                if let recurringDisclaimer = viewModel.state.paymentOptions.recurringDisclaimer {
                    RecurringDisclaimer(text: recurringDisclaimer.string)
                }
                PolicyView()
                FooterView()
            }
            .padding(.top, UIScheme.dimension.middleSpacing)
            .padding([.bottom, .horizontal], UIScheme.dimension.largeSpacing)
        }.onAppear {
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }

    @ViewBuilder
    private var overviewView: some View {
        switch viewModel.state.paymentOptions.action {
        case .Tokenize:
            EmptyView()
        case .Verify:
            VerifyOverview(
                paymentID: viewModel.state.paymentOptions.paymentID,
                paymentDescription: viewModel.state.paymentOptions.paymentDescription,
                recurringData: viewModel.state.paymentOptions.recurringDetails,
                backgroundTemplate: UIScheme.infoCardBackground,
                logoImage: viewModel.state.paymentOptions.summary.logo
            )
        default:
            PaymentOverview(
                isVatIncluded: viewModel.state.isVatIncluded,
                priceValue: viewModel.state.paymentOptions.summary.value,
                currency: viewModel.state.paymentOptions.summary.currency,
                recurringData: viewModel.state.paymentOptions.recurringDetails,
                paymentDetails: viewModel.state.paymentOptions.details,
                backgroundTemplate: UIScheme.infoCardBackground,
                logoImage: viewModel.state.paymentOptions.summary.logo
            )
        }
    }

    private var buttonLabel: some View {
        switch viewModel.state.paymentOptions.action {
        case .Tokenize:
            return PayButtonLabel(style: .Proceed)
        case .Verify:
            return PayButtonLabel(style: .Verify)
        default:
            return PayButtonLabel(
                style: .Pay(
                    viewModel.state.paymentOptions.summary.value,
                    currency: viewModel.state.paymentOptions.summary.currency
                )
            )
        }
    }
}

#if DEBUG

struct CustomerFieldsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomerFieldsScreen(viewModel: CustomerFieldsScreenModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif
