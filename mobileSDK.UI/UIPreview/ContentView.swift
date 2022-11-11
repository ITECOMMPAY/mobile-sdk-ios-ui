//
//  ContentView.swift
//  UIPreview
//
//  Created by Ivan Krapivtsev on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // SavedCardCheckoutView_Previews.previews
        // PaymentMethodsScreen_Previews.previews
        // PaymentMethodCell_Previews.previews
        // PanField_Previews.previews
        LoadingScreen_Previews.previews
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
