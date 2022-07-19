//
//  SavedCardCheckoutView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 11.07.2022.
//

import SwiftUI

struct SavedCardCheckoutView: View {
    @State var cvvText: String = ""
    var payAction: () -> Void = {}
    var deleteCardAction: () -> Void = {}

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: UIScheme.dimension.formSmallSpacing) {
                dateField
                cvvField
            }
            .padding(.top, UIScheme.dimension.formSmallSpacing)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)

            PayButton(label: PayButtonLabel(style: .Pay(100.50, currency: "RUB")), action: payAction)
                .padding(.bottom, UIScheme.dimension.middleSpacing)


            LinkButton(text: "Delete Card",
                       fontSize: UIScheme.dimension.smallFont,
                       foregroundColor: UIScheme.color.deleteCardButtonColor,
                       onTap: deleteCardAction)
            .padding(.bottom, UIScheme.dimension.formLargeVerticalSpacing)
        }.padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
    }

    var dateField: some View {
        FormTextField.init(.constant("07/23"),
                           placeholder: "Expiration",
                           required: false,
                           hint: .constant(""),
                           valid: .constant(true),
                           disabled: .constant(true),
                           accessoryView: EmptyView())
    }

    var cvvField: some View {
        FormTextField.init($cvvText,
                           placeholder: "CVC",
                           secure: true,
                           required: true,
                           hint: .constant(""),
                           valid: .constant(true),
                           disabled: .constant(false),
                           accessoryView: EmptyView())
    }
}

#if DEBUG

struct SavedCardCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCardCheckoutView().previewLayout(.sizeThatFits)
    }
}

#endif
