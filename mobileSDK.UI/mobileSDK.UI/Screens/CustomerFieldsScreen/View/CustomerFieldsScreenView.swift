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
    @State var customerFieldValues: [FieldValue] = []

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
            }.padding([.trailing, .leading, .top], UIScheme.dimension.largeSpacing)
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
                EmbeddedCustomerFieldsView(visibleCustomerFields: viewModel.state.visibleCustomerFields,
                                           additionalFields: viewModel.state.paymentOptions.uiAdditionalFields) { customerFieldValues, isValid in
                    self.customerFieldValues = customerFieldValues
                    self.isValid = isValid
                }.padding(.vertical, UIScheme.dimension.middleSpacing)
                PayButton(label: PayButtonLabel(style: .Continue), disabled: !isValid) {
                    viewModel.dispatch(intent: .sendCustomerFields(customerFieldValues))
                }
                PolicyView()
                    .padding(.top, UIScheme.dimension.middleSpacing)
                FooterView()
                    .padding(.bottom, UIScheme.dimension.largeSpacing)

            }
            .padding([.trailing, .leading], UIScheme.dimension.largeSpacing)
            .padding(.top, UIScheme.dimension.middleSpacing)
        }
    }
}

struct CustomerFieldsScreen_Previews: PreviewProvider {
    struct PreviewOptions: PaymentOptions {
        var summary: PaymentSummaryData = PaymentSummaryData(currency: "RUB", value: 123.23)

        var details: [PaymentDetailData] = []

        var uiAdditionalFields: [AdditionalField] = []
    }

    struct MockCustomerField: CustomerField {
        var fieldServerType: FieldServerType = .text
        var name: String
        var isRequired: Bool = true
        var isHidden: Bool = false
        var isTokenize: Bool = false
        var isVerify: Bool = false
        var hint: String? = "mockField hint"
        var label: String = "mockField label"
        var placeholder: String? = "mockField placeholder"
        var validatorName: String? = "mockField validatorName"
        var validatonMethod: Validator<String>? = { _ in true }
        var fieldType: FieldType = .unknown
        var errorMessage: String? = "mockField error"
        var errorMessageKey: String = "mockField error key"
    }

    struct PreviewState: CustomerFieldsScreenState {
        var paymentOptions: PaymentOptions = PreviewOptions()

        var visibleCustomerFields: [CustomerField] = [
            MockCustomerField(name: "field 1"),
            MockCustomerField(name: "field 2")
        ]

        var isVatIncluded: Bool = true
    }

    class PreviewModel: CustomerFieldsScreenModelProtocol {
        var state: CustomerFieldsScreenState = PreviewState()

        func dispatch(intent: CustomerFieldsScreenIntent) {}
    }

    static var previews: some View {
        CustomerFieldsScreen(viewModel: PreviewModel())
    }
}
