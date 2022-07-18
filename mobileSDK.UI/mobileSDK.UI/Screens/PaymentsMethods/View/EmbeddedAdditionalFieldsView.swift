//
//  EmbeddedAdditionalFieldsView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 18.07.2022.
//

import SwiftUI

struct EmbeddedAdditionalFieldsView: View {
    @State var field1: String = ""
    @State  var field2: String = ""

    var body: some View {
        VStack(spacing: UIScheme.dimension.formSmallSpacing) {
            FormTextField.init($field1,
                               placeholder: "Email",
                               secure: false,
                               required: true,
                               hint: .constant(""),
                               valid: .constant(true),
                               disabled: .constant(false),
                               accessoryView: EmptyView())
            FormTextField.init($field2,
                               placeholder: "Another customer field",
                               secure: false,
                               required: true,
                               hint: .constant(""),
                               valid: .constant(true),
                               disabled: .constant(false),
                               accessoryView: EmptyView())
        }
    }
}

#if DEBUG

struct EmbeddedAdditionalFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        EmbeddedAdditionalFieldsView()
    }
}

#endif
