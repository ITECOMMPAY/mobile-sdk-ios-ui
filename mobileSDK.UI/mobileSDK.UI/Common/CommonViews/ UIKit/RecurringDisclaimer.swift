//
//  RecurringDisclaimer.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 13.04.2023.
//

import SwiftUI

struct RecurringDisclaimer: View {
    let text: String
    var body: some View {
        Text(text)
            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.tinyFont))
            .foregroundColor(UIScheme.color.secondaryTextColor)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
}

#if DEBUG

struct RecurringDisclaimer_Previews: PreviewProvider {
    static var previews: some View {
        RecurringDisclaimer(text: "Recurring disclaimer")
    }
}

#endif
