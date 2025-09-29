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
                .onTapGesture {
                    if isCollapsible {
                        onTap()
                    }
                }
                .accessibilityElement(children: .combine)
            content
                .opacity(isExpanded ? 1 : 0)
                .frame(maxHeight: isExpanded ? .infinity : 0)
                .zIndex(-1)
        }
        .background(UIScheme.color.cardBackground)
        .clipShape(
            .rect(
                topLeadingRadius: UIScheme.dimension.buttonCornerRadius,
                bottomLeadingRadius: UIScheme.dimension.buttonCornerRadius,
                bottomTrailingRadius: UIScheme.dimension.buttonCornerRadius,
                topTrailingRadius: UIScheme.dimension.buttonCornerRadius
            )
        )
    }
    
    @ViewBuilder
    private var header: some View {
        if hasHeader {
            HStack {
                titleView
                Spacer()
                iconView
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal, UIScheme.dimension.middleSpacing)
            .frame(height: UIScheme.dimension.paymentMethodButtonHeight)
            .background(UIScheme.color.cardBackground)
        } else {
            EmptyView()
        }
    }
    
    var titleView: some View {
        Text(methodTitle)
            .font(.custom(.primary(size: .s, weight: .regular)))
            .foregroundColor(UIScheme.color.inputTextPrimary)
            .accessibilityLabel(Text(isSavedAccount ? "Saved card \(methodTitle)" : methodTitle))
            .accessibilityHint(isExpanded ? "Expanded" : "Collapsed")
    }

    var iconView: some View {
        methodImage
            .frame(width: 50, height: 25, alignment: .trailing)
    }
}

#if DEBUG

struct PaymentMethodCell_Previews: PreviewProvider {
    struct PaymentMethodCellExample: View {
        @State var expanded: Int = 0
        
        var body: some View {
            ScrollView {
                VStack {
                    PaymentMethodCell(
                        methodTitle: "Alipay",
                        methodImage: EmptyView(),
                        isSavedAccount: false,
                        isExpanded: expanded == 1,
                        content: Color.red.frame(height: 100),
                        onTap: { expanded = 1 }
                    )
                }
            }
        }
    }

    static var previews: some View {
        PaymentMethodCellExample()
            .previewLayout(.sizeThatFits)
    }
}

#endif
