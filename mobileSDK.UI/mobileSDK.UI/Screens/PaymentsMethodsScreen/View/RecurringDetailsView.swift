//
//  RecurringDetailsView.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 02.02.2023.
//

import SwiftUI

struct RecurringDetailsView: View {
    let details: [RecurringDetailsData]

    var body: some View {
        VStack(alignment: .leading, spacing: UIScheme.dimension.paymentDetailsSpacing) {
            ForEach(details, id: \.title) { detail in
                PaymentRecurringAttributes(
                    labelText: detail.title.string,
                    descriptionText: detail.description.stringValue
                )
            }
            Divider()
                .frame(maxWidth: .infinity)
                .frame(height: UIScheme.dimension.dividerHeight)
                .overlay(UIScheme.color.paymentDetailsBackgroundColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PaymentRecurringAttributes: View {
    var labelText: String
    var descriptionText: String

    var body: some View {
        HStack() {
            Text(labelText)
                .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                .foregroundColor(UIScheme.color.paymentDetailsForegroundColor)
            Spacer()
            Text(descriptionText)
                .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                .foregroundColor(UIScheme.color.paymentDetailsForegroundColor)
        }
    }
}

#if DEBUG

struct RecurringDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red
            RecurringDetailsView(
                details: [
                    RecurringDetailsData(
                        title: L.title_payment_id,
                        description: .value("EP2e11-f018-RQR12-26VL-0412CS")
                    ),
                    RecurringDetailsData(
                        title: L.title_payment_information_description,
                        description: .value("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                    )
                ]
            )
        }
    }
}

#endif
