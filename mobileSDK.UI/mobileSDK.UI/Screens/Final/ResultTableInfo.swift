//
//  ResultTableInfo.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 10.08.2022.
//

import SwiftUI

struct ResultTableInfo: View {
    let recurringDetails: [RecurringDetailsData]
    let showRecurringError: Bool
    let resultInfoKeyValuePairs: [(key: String?, value: String?)]
    var body: some View {
        VStack(spacing: UIScheme.dimension.middleSpacing) {
            recurringInfo
            ForEach(resultInfoKeyValuePairs, id: \.key) { pair in
                if let key = pair.key, let value = pair.value {
                    HStack(alignment: .firstTextBaseline) {
                        Text(TranslationsManager.shared.stringValue(for: key) ?? key)
                            .font(.custom(.primary(size: .s, weight: .regular)))
                            .foregroundColor(UIScheme.color.inputTextAdditional)
                        Spacer()
                        Text(value)
                            .font(.custom(.primary(size: .s, weight: .regular)))
                            .foregroundColor(UIScheme.color.inputTextPrimary)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(UIScheme.dimension.largeSpacing)
        .background(UIScheme.color.cardBackground)
        .clipShape(
            .rect(
                topLeadingRadius: UIScheme.dimension.backgroundSheetCornerRadius,
                bottomLeadingRadius: UIScheme.dimension.backgroundSheetCornerRadius,
                bottomTrailingRadius: UIScheme.dimension.backgroundSheetCornerRadius,
                topTrailingRadius: UIScheme.dimension.backgroundSheetCornerRadius
            )
        )
    }

    @ViewBuilder
    private var recurringInfo: some View {
        if recurringDetails.isEmpty && !showRecurringError {
            EmptyView()
        } else {
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                if showRecurringError {
                    Text(L.recurring_fail.string)
                        .font(.custom(.primary(size: .s, weight: .regular)))
                        .foregroundColor(UIScheme.color.inputTextPrimary)
                        .multilineTextAlignment(.center)
                }
                ForEach(recurringDetails, id: \.title) { details in
                    HStack(alignment: .firstTextBaseline) {
                        Text(details.title.string)
                            .font(.custom(.primary(size: .s, weight: .regular)))
                            .foregroundColor(UIScheme.color.inputTextAdditional)
                        Spacer()
                        Text(details.description.stringValue)
                            .font(.custom(.primary(size: .s, weight: .regular)))
                            .foregroundColor(UIScheme.color.inputTextPrimary)
                    }
                }
                Line()
                  .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                  .frame(height: 1)
                  .foregroundColor(UIScheme.color.inputTextAdditional)
                  .accessibilityHidden(true)
            }
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

#if DEBUG

struct ResultTableInfo_Previews: PreviewProvider {
    static var previews: some View {
        ResultTableInfo(
            recurringDetails: [
                .init(title: L.recurring_start_date, description: .value("November 19, 2023"))
            ],
            showRecurringError: true,
            resultInfoKeyValuePairs: [
                ("Label1", "Value1"),
                ("Label2", "Value2"),
                ("Label3", "Value3")
            ]
        )
        .previewLayout(.sizeThatFits)
    }
}

#endif
