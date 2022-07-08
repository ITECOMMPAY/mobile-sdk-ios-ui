//
//  ContentView.swift
//  UIPreview
//
//  Created by Ivan Krapivev on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PaymentMethodsView_Previews.previews
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
