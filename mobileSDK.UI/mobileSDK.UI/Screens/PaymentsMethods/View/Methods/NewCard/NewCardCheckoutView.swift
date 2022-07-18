//
//  NewCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 18.07.2022.
//

import SwiftUI

struct NewCardCheckoutView: View {
    var payAction: () -> Void = {}

    @State var isCOFAgreementChecked: Bool = false

    @State var cvvText: String = ""

    @State var cardNumber:  String = "" {
        didSet {
            isCardValid = cardValidator(cardNumber)
        }
    }

    var cardValidator: (String) -> Bool = {
        !$0.contains {
            !$0.isNumber
        }
    }
    @State var isCardValid: Bool = true



    var body: some View {
        VStack(spacing: 0) {
            FormTextField($cardNumber,
                          placeholder: "Card Number",
                          secure: false,
                          required: true,
                          hint: .constant(""),
                          valid: $isCardValid,
                          disabled: .constant(false),
                          accessoryView: EmptyView())
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            FormTextField($cardNumber,
                          placeholder: "Cardholder",
                          secure: false,
                          required: true,
                          hint: .constant(""),
                          valid: .constant(true),
                          disabled: .constant(false),
                          accessoryView: EmptyView())
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            HStack(spacing: UIScheme.dimension.formSmallSpacing) {
                FormTextField.init(.constant("07/23"),
                                   placeholder: "Expiration",
                                   required: false,
                                   hint: .constant(""),
                                   valid: .constant(true),
                                   disabled: .constant(true),
                                   accessoryView: EmptyView())
                FormTextField.init($cvvText,
                                   placeholder: "CVC",
                                   secure: true,
                                   required: true,
                                   hint: .constant(""),
                                   valid: .constant(true),
                                   disabled: .constant(false),
                                   accessoryView: InfoButton())
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)

            EmbeddedAdditionalFieldsView()
                .padding(.top, UIScheme.dimension.formSmallSpacing)
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

            HStack(alignment: .top, spacing: UIScheme.dimension.formSmallSpacing) {
                CheckBoxView(checked: $isCOFAgreementChecked)

                VStack(alignment: .leading, spacing: UIScheme.dimension.paymentDetailsAttributeSpacing) {
                    Text("Save card details")
                        .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
                        .foregroundColor(UIScheme.color.text)
                    Text("By clicking checkbox and saving card details.\n I agree with COF Agreement")
                        .font(UIScheme.font.commonRegular(size: UIScheme.dimension.tinyFont))
                        .foregroundColor(UIScheme.color.textFieldPlaceholderColor)

                }
                Spacer()
            }
            .padding(.bottom, UIScheme.dimension.formSmallSpacing)

            PayButton(label: PayButtonLabel(style: .Pay(100.50, currency: "RUB")), action: payAction)
                .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

        }
        .padding([.leading, .trailing], UIScheme.dimension.middleSpacing)

    }
}

#if DEBUG

struct NewCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardCheckoutView()
    }
}

#endif
