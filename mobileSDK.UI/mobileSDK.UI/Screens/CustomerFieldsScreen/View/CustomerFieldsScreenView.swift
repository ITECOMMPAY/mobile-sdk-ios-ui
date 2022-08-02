//
//  CustomerFieldsScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 28.07.2022.
//

import SwiftUI

struct CustomerFieldsScreen<VM: CustomerFieldsScreenModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM
    @State var isValid: Bool = false

    var body: some View {
        BottomCardViewContent {
            VStack(alignment: .leading, spacing: UIScheme.dimension.middleSpacing) {
                HStack(alignment: .center) {
                    ScreenHeader(text: L.title_payment_additional_data.string)
                    Spacer()
                    BackButton {
                        viewModel.dispatch(intent: .back)
                    }
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
                Text(L.title_payment_additional_data_disclaimer.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.text)
                EmbeddedFieldView(visibleCustomerFields: viewModel.state.visibleCustomerFields, customerFieldValues: .constant([]), isValid: $isValid)
                PayButton(label: PayButtonLabel(style: .Continue), disabled: isValid) {
                    viewModel.dispatch(intent: .continueFlow)
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
    static var previews: some View {
        // TODO: repare preview
        EmptyView()
        // CustomerFieldsScreen(viewModel: CustomerFieldsScreenModel(parentViewModel: v))
    }
}
