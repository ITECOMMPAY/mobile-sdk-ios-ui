//
//  CheckBoxView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Button {
            self.checked.toggle()
        } label: {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(checked ? UIScheme.color.brandColor : UIScheme.color.checkboxBorder)
        }
    }
}

#if DEBUG

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}

#endif
