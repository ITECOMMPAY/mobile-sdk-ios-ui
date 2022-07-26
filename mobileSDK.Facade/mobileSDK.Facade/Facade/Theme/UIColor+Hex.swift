//
//  UIColor+Additions.swift
//  mobilesdk-ios
//
//  Created by Ecommpay on 10/31/17.
//  Copyright © 2017 Ecommpay. All rights reserved.
//

import UIKit

extension UIColor {
    class var darkGray: UIColor {
        return UIColor(red: 216.0 / 255.0, green: 216.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0)
    }

    class var errorRed: UIColor {
        return UIColor(red: 222.0 / 255.0, green: 123.0 / 255.0, blue: 123.0 / 255.0, alpha: 1.0)
    }

    convenience init(hexFromString: String, alpha: CGFloat = 1.0) {
        var cString: String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 10066329 // color #999999 if string has wrong format

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) == 6 {
            Scanner(string: cString).scanHexInt64(&rgbValue)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

    func multiplied(by multiplier: CGFloat) -> UIColor {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            return UIColor(red: 1.0 - (1.0 - fRed) * multiplier,
                           green: 1.0 - (1.0 - fGreen) * multiplier,
                           blue: 1.0 - (1.0 - fBlue) * multiplier,
                           alpha: fAlpha)
        }
        return self
    }
}
