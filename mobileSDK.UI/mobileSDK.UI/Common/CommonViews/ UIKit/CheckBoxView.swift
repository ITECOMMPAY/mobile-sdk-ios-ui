//
//  CheckBoxView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 18.07.2022.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack(spacing: UIScheme.dimension.formSmallSpacing) {
                ZStack {
                    Image(systemName: configuration.isOn ? "square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(configuration.isOn ? UIScheme.color.checkboxSelectedBackground : UIScheme.color.checkboxUnselectedForeground)
                        .background(configuration.isOn ? .clear : UIScheme.color.checkboxUnselectedBackground)
                        .cornerRadius(2.7)
                    if configuration.isOn {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 10, height: 8)
                            .foregroundColor(UIScheme.color.checkboxSelectedForeground)
                    }
                }.accessibilityElement(children: .ignore)

                configuration.label
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.middleFont))
                    .foregroundColor(UIScheme.color.text)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Button {
            self.checked.toggle()
        } label: {
            ZStack {
                Image(systemName: checked ? "square.fill" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(checked ? UIScheme.color.checkboxSelectedBackground : UIScheme.color.checkboxUnselectedForeground)
                    .background(checked ? .clear : UIScheme.color.checkboxUnselectedBackground)
                    .cornerRadius(2.7)
                if checked {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 10, height: 8)
                        .foregroundColor(UIScheme.color.checkboxSelectedForeground)
                }
            }
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
