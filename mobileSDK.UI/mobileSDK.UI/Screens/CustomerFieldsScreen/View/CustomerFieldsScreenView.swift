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
                PaymentDetailsView(details: viewModel.state.paymentOptions.details)
            }.padding([.horizontal, .top], UIScheme.dimension.largeSpacing)
        } content: {
            VStack(spacing: .zero) {
                PaymentOverview(isVatIncluded: viewModel.state.isVatIncluded,
                                priceValue: viewModel.state.paymentOptions.summary.value,
                                currency: viewModel.state.paymentOptions.summary.currency,
                                backgroundTemplate: UIScheme.infoCardBackground,
                                logoImage: viewModel.state.paymentOptions.summary.logo)
                Text(L.title_payment_additional_data_disclaimer.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.text)
                    .padding(.top, UIScheme.dimension.middleSpacing)
                    .fixedSize(horizontal: false, vertical: true)
                EmbeddedCustomerFieldsView(
                    visibleCustomerFields: viewModel.state.visibleCustomerFields,
                    additionalFields: viewModel.state.paymentOptions.uiAdditionalFields,
                    customerFieldValues: customerFieldValues
                ) { customerFieldValues, isValid in
                    viewModel.dispatch(intent: .store(customerFieldValues))
                    self.isValid = isValid
                }.padding(.vertical, UIScheme.dimension.middleSpacing)
                PayButton(
                    label: PayButtonLabel(style: .Pay(viewModel.state.paymentOptions.summary.value,
                                                      currency: viewModel.state.paymentOptions.summary.currency)),
                    disabled: !isValid
                ) {
                    viewModel.dispatch(intent: .sendCustomerFields(customerFieldValues))
                }
                PolicyView()
                    .padding(.top, UIScheme.dimension.middleSpacing)
                FooterView()
                    .padding(.bottom, UIScheme.dimension.largeSpacing)

            }
            .padding(.horizontal, UIScheme.dimension.largeSpacing)
            .padding(.top, UIScheme.dimension.middleSpacing)
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
