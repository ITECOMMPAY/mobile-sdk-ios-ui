//
//  ScanCardScreen.swift
//  mobileSDK.UI
//
//  Created by Artem Serebrennikov on 15.02.2023.
//

import Foundation
import SwiftUI
import AVFoundation
import CardIO

typealias ScannedCardInfo = (cardNumber: String?, cardExpiry: String?)
typealias ScanCardCompletion = (ScannedCardInfo) -> Void

struct ScanCardButton: View {
    var onCardScanned: ScanCardCompletion?

    var body: some View {
        CardIOVCRepresentable(onCardScanned: onCardScanned)
            .frame(width: UIScheme.dimension.textFieldHeight, height: UIScheme.dimension.textFieldHeight)
            .background(UIScheme.color.textFieldNormalBackgroundColor.overlay(
                RoundedRectangle(
                    cornerRadius: UIScheme.dimension.buttonCornerRadius,
                    style: .continuous
                )
                .stroke(
                    UIScheme.color.textFieldNormalBorderColor,
                    lineWidth: UIScheme.dimension.borderWidth
                )
            ))
            .cornerRadius(UIScheme.dimension.buttonCornerRadius)
    }
}

final class CardIOVC: UIViewController {
    var onCardScanned: ScanCardCompletion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardIOUtilities.preload()

        setupScanButton()
    }

    private func setupScanButton() {
        let cameraImage = IR.scanButton.uiImage?.withTintColor(
            UIColor(UIScheme.color.scanCardIconColor),
            renderingMode: .alwaysOriginal
        )
        
        let button = UIButton(frame: .init(x: 0, y: 0, width: 20, height: 20))
        button.setImage(cameraImage, for: .normal)
        button.isUserInteractionEnabled = false

        let tap = UITapGestureRecognizer(target: self, action: #selector(showCardIO))
        view.addGestureRecognizer(tap)

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    @objc func showCardIO() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied:
            showSettingsAlert()
        case .authorized: presentCardIO()
        default:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async { [weak self] in
                        self?.presentCardIO()
                    }
                }
            }
        }
    }

    private func showSettingsAlert() {
        let alert = UIAlertController(
            title: L.title_camera_permission.string,
            message: "",
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: L.button_camera_permission.string,
                style: .default
            ) { action in
                if let url = URL(string:UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        )
        alert.addAction(
            UIAlertAction(
                title: L.button_cancel.string,
                style: .cancel
            )
        )

        self.present(alert, animated: true, completion: nil)
    }

    private func presentCardIO() {
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)

        cardIOVC?.hideCardIOLogo = true
        cardIOVC?.collectCVV = false
        cardIOVC?.disableManualEntryButtons = true
        cardIOVC?.guideColor = UIColor(UIScheme.color.brandColor)
        cardIOVC?.suppressScanConfirmation = true
        cardIOVC?.scannedImageDuration = 0
        cardIOVC?.modalPresentationStyle = .formSheet
        cardIOVC?.navigationBar.backgroundColor = .white
        
        if let vc = cardIOVC {
            present(vc, animated: true)
        }
    }
}

extension CardIOVC: CardIOPaymentViewControllerDelegate {
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        dismiss(animated: true)
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        if let info = cardInfo {
            var expiry: String?
            if info.expiryMonth > 0, info.expiryYear > 0 {
                expiry = "\(String(format: "%02d", info.expiryMonth))/\(String(info.expiryYear).suffix(2))"
            }
            
            onCardScanned?((cardNumber: info.cardNumber, cardExpiry: expiry))
        }
        dismiss(animated: true)
    }
    
    
}

struct CardIOVCRepresentable: UIViewControllerRepresentable {
    var onCardScanned: ScanCardCompletion?
    
    func makeUIViewController(context: Context) -> CardIOVC {
        let vc = CardIOVC()
        vc.onCardScanned = onCardScanned
        return vc
    }

    func updateUIViewController(_ uiViewController: CardIOVC, context: Context) { }
}

