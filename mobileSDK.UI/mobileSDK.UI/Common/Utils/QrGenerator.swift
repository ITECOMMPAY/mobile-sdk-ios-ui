//
//  QrGenerator.swift
//  mobileSDK.UI
//
//  Created by Claude on 21.05.2026.
//

import UIKit
import CoreImage

struct QrGenerator {
    /// Generates a QR code image from a string
    /// - Parameters:
    ///   - content: The string content to encode in the QR code
    ///   - size: The size of the generated QR code image (default: 512)
    /// - Returns: A UIImage containing the QR code, or nil if generation fails
    static func generateQrImage(from content: String, size: CGFloat = 512) -> UIImage? {
        guard !content.isEmpty else { return nil }

        let context = CIContext()
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }

        guard let data = content.data(using: .utf8) else { return nil }

        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("M", forKey: "inputCorrectionLevel")

        guard let outputImage = filter.outputImage else { return nil }

        // Scale the QR code to the desired size
        let scaleX = size / outputImage.extent.size.width
        let scaleY = size / outputImage.extent.size.height
        let transformedImage = outputImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

        guard let cgImage = context.createCGImage(transformedImage, from: transformedImage.extent) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
