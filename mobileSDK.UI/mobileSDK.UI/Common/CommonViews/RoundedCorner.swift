//
//  RoundedCorner.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 15.06.2022.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }

    func cornerRadius(_ radius: Float, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: CGFloat(radius), corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
