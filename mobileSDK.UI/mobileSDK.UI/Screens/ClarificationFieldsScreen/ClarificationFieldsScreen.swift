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
                PaymentOverview(isVatIncluded: viewModel.state.isVatIncluded,
                                priceValue: viewModel.state.paymentOptions.summary.value,
                                currency: viewModel.state.paymentOptions.summary.currency,
                                paymentDetails: viewModel.state.paymentOptions.details,
                                backgroundTemplate: UIScheme.infoCardBackground,
                                logoImage: viewModel.state.paymentOptions.summary.logo)
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
                    label: PayButtonLabel(style: .Pay(viewModel.state.paymentOptions.summary.value,
                                                      currency: viewModel.state.paymentOptions.summary.currency)),
                    disabled: !isValid
                ) {
                    viewModel.dispatch(intent: .sendFilledFields(clarificationFieldsValues))
                }
                PolicyView()
                FooterView()
            }
            .padding(.top, UIScheme.dimension.middleSpacing)
            .padding([.bottom, .horizontal], UIScheme.dimension.largeSpacing)
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
