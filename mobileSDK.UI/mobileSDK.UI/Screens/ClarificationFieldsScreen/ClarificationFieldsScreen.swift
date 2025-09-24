//
//  ClarificationFieldsScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 05.08.2022.
//

import SwiftUI

struct ClarificationFieldsScreen<VM: ClarificationFieldsScreenModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM
    @State var isValid: Bool = false
    @State var clarificationFieldsValues: [FieldValue] = []

    var body: some View {
        BottomCardViewContent {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: L.title_payment_additional_data.string)
                    Spacer()
                    CloseButton {
                        viewModel.dispatch(intent: .close)
                    }
                }
                .frame(maxWidth: .infinity)
            }.padding([.horizontal, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                overviewView
                Text(L.title_payment_additional_data_disclaimer.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.text)
                    .fixedSize(horizontal: false, vertical: true)
                EmbeddedCustomerFieldsView(
                    visibleCustomerFields: viewModel.state.clarificationFields?.map { $0.asCustomerField } ?? [],
                    additionalFields: [],
                    customerFieldValues: []
                ) { newFieldValues, isValid in
                    self.clarificationFieldsValues = newFieldValues
                    self.isValid = isValid
                }
                PayButton(
                    label: buttonLabel,
                    disabled: !isValid
                ) {
                    viewModel.dispatch(intent: .sendFilledFields(clarificationFieldsValues))
                }
                if let recurringDisclaimer = viewModel.state.paymentOptions.recurringDisclaimer {
                    RecurringDisclaimer(text: recurringDisclaimer.string)
                }
                PolicyView()
                FooterView(footerImage: viewModel.state.paymentOptions.footerImage)
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
                logoImage: viewModel.state.paymentOptions.summary.logo
            )
        default:
            PaymentOverview(
                priceValue: viewModel.state.paymentOptions.summary.value,
                currency: viewModel.state.paymentOptions.summary.currency,
                recurringData: viewModel.state.paymentOptions.recurringDetails,
                paymentDetails: viewModel.state.paymentOptions.details,
                logoImage: viewModel.state.paymentOptions.summary.logo
            )
        }
    }

    private var buttonLabel: some View {
        switch viewModel.state.paymentOptions.action {
        case .Tokenize:
            return PayButtonLabel(style: .proceed)
        case .Verify:
            return PayButtonLabel(style: .verify)
        default:
            return PayButtonLabel(
                style: .pay(
                    amount: viewModel.state.paymentOptions.summary.value,
                    currency: viewModel.state.paymentOptions.summary.currency
                )
            )
        }
    }
}

#if DEBUG

struct ClarificationFieldsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ClarificationFieldsScreen(viewModel: ClarificationFieldsScreenModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif
