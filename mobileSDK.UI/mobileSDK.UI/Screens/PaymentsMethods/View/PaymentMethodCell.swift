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
    var isExpanded: Bool

    let content: Content
    let onTap: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Button(action: onTap) {
                HStack {
                    iconView
                    Spacer()
                    titleView
                    chevron
                }
            }.padding([.leading, .trailing], UIScheme.dimension.middleSpacing)
                .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
                .background {
                    isSavedAccount && !isExpanded
                    ? UIScheme.color.savedAccountBackground
                    : UIScheme.color.paymentMethodBackground
            }
            VStack {
                if isExpanded {
                    content.transition(.move(edge: .top).combined(with: .opacity))
                }
            }.clipped()
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
        Text(methodTitle)
            .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
            .foregroundColor(UIScheme.color.text)
    }

    var chevron: some View {
        IR.chevron.image.rotationEffect(isExpanded ? .degrees(180) : .zero)
    }

}

#if DEBUG

struct PaymentMethodCell_Previews: PreviewProvider {

    struct PaymentMethodCellExample: View {
        @State var expanded: Int = 0
        var body: some View {
            ScrollView {
                VStack {
                    PaymentMethodCell(methodTitle: "Alipay",
                                      methodImage: IR.alipay.image,
                                      isSavedAccount: false,
                                      isExpanded: expanded == 1,
                                      content: Color.red.frame(height: 100),
                                      onTap: { expanded = 1 })
                }
            }
        }
    }

    static var previews: some View {
        PaymentMethodCellExample().previewLayout(.sizeThatFits)
    }
}
#endif
