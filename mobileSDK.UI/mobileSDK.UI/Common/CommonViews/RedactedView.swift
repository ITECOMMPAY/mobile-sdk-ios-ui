//
//  RedactedView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 10.06.2022.
//

import SwiftUI

#if DEBUG
struct RedactedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RedactedView().frame(width: 200, height: 100, alignment: .center)
            RedactedView().frame(width: 200, height: 50, alignment: .center)
        }
    }
}
#endif

struct RedactedView: View {
    var body : some View {
        UIScheme.color.shimmeringBackground
            .shimmering()
    }
}
