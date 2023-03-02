//
//  PaymentMethodCell.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 30.06.2022.
//

import SwiftUI

struct PaymentMethodCell<Content: View, Logo: View>: View {
    let methodTitle: String
    let methodImage: Logo
    var isSavedAccount: Bool = false
    var isExpanded: Bool
    var isCollapsible: Bool = true
    var hasHeader: Bool = true

    let content: Content
    let onTap: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            header
            VStack {
                if isExpanded {
                    content.transition(.move(edge: .top).combined(with: .opacity))
                }
            }.clipped()
        }
        .background(UIScheme.color.paymentMethodBackground)
        .cornerRadius(UIScheme.dimension.buttonCornerRadius, corners: .allCorners)
        .overlay(
            RoundedRectangle(cornerRadius: UIScheme.dimension.buttonCornerRadius)
                .stroke(UIScheme.color.paymentMethodBorder, lineWidth: UIScheme.dimension.borderWidth)
        )
    }
    
    @ViewBuilder
    private var header: some View {
        if hasHeader {
            Button(action: {
                guard isCollapsible else { return }
                onTap()
            }) {
                HStack {
                    iconView
                    Spacer()
                    titleView
                    if isCollapsible {
                        chevron
                    }
                }
            }.padding(.horizontal, UIScheme.dimension.middleSpacing)
                .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
                .background {
                    isSavedAccount && !isExpanded
                    ? UIScheme.color.savedAccountBackground
                    : UIScheme.color.paymentMethodBackground
                }
        } else {
            EmptyView()
        }
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
        IR.chevron.image?
            .renderingMode(.template)
            .foregroundColor(UIScheme.color.text)
            .rotationEffect(isExpanded ? .degrees(180) : .zero)
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
                                      methodImage: EmptyView(),
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
