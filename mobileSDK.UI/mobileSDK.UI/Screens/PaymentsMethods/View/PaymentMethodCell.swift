//
//  PaymentMethodCell.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 30.06.2022.
//

import SwiftUI

struct PaymentMethodCell<Content: View>: View {
    let methodTitle: String
    let methodImage: Image?
    var isSavedAccount: Bool = false
    @State var isExpanded: Bool = false

    let content: Content

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                iconView
                Spacer()
                titleView
                chevronButton
            }
            .padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
            .frame(height: 50).onTapGesture {
                isExpanded.toggle()
            }
            content.applyIf(!isExpanded) {
                $0.hidden().frame(height: 0)
            }
        }
        .background {
            isSavedAccount ? UIScheme.color.savedAccountBackground : Color.clear
        }
        .cornerRadius(UIScheme.dimension.buttonCornerRadius, corners: .allCorners)
        .overlay(
            RoundedRectangle(cornerRadius: UIScheme.dimension.buttonCornerRadius)
                .stroke(UIScheme.color.border, lineWidth: UIScheme.dimension.borderWidth)
        )
    }

    var iconView: some View {
        methodImage.frame(width: 50, height: 25, alignment: .leading)
    }

    var titleView: some View {
        Text(methodTitle).font(UIScheme.font.commonRegular).foregroundColor(UIScheme.color.text)
    }

    var chevronButton: some View {
        Button {
            onTapExpand()
        } label: {
            IR.chevron.image.rotationEffect(isExpanded ? .degrees(180) : .zero)
        }
    }

    func onTapExpand() {
        isExpanded.toggle()
    }
}

#if DEBUG
struct PaymentMethodCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PaymentMethodCell(methodTitle: "Alipay",
                              methodImage: IR.alipay.image,
                              isSavedAccount: false,
                              content: Color.red.frame(height: 100))
            PaymentMethodCell(methodTitle: "*** 3456",
                              methodImage: IR.visa.image,
                              isSavedAccount: true,
                              content: Color.red.frame(height: 200))
        }
    }
}
#endif


