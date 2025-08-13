//
//  ContentView.swift
//  IntegrationExampleSwiftUI
//
//  Created by Ivan Krapivtsev on 08.11.2022.
//

import SwiftUI
import EcommpaySDK

struct ContentView: View {
    private let secret = "your_secret"
    private let project_id: Int32 = 10 // your project id

    @State private var result: PaymentResult?
    @State private var isPaymentPagePresented: Bool = true
    @State private var ecompaySDK = EcommpaySDK()

    private var paymentOptions: PaymentOptions {
        // Create payment info with product information
        let paymentOptions = getPaymentOptionsAllParams() // getPaymentOptionsOnlyRequiredParams

        // Set action type if needed
        paymentOptions.action = .Sale
        
        #warning("Signature should be generated on your server and delivered to your app")
        let signature = Utils.signature(paramsToSign: paymentOptions.paramsForSignature, secret: secret)
        // Sign payment info
        paymentOptions.signature = signature

        //enable test environment
        paymentOptions.mockModeType = .success // built in mocks will be used instead of making real server requests to server

        return paymentOptions
    }

    func getPaymentOptionsAllParams() -> PaymentOptions {
        return PaymentOptions(
            projectID: project_id,
            paymentID: "internal_payment_id_\(UUID().uuidString)",
            paymentAmount: 1999,
            paymentCurrency: "USD",
            paymentDescription: "T-shirt with dog print",
            customerID: "10", // unique ID assigned to your customer
            regionCode: "",
            token: nil // saved card token for tokenized actions
        )
    }

    var body: some View {
        Color.gray.ignoresSafeArea() // instead of the solid color view supposed to be the view of your app
            .overlay(paymentPage)
            .alert(isPresented: .constant(result != nil)) {
                alert!
            }
    }

    @ViewBuilder
    var paymentPage: some View {
        if isPaymentPagePresented {
            ecompaySDK.getPaymentView(with: paymentOptions, completion: {
                result = $0
                isPaymentPagePresented = false
            })
        } else {
            EmptyView()
        }
    }

    var alert: Alert? {
        if let result = result {
            let statusCode = String(result.status.rawValue)
            let errorCodeString = result.error?.codeString ?? ""
            return Alert(
                title: Text("\(statusCode) \(errorCodeString)"),
                message: Text(result.error?.message ?? ""),
                dismissButton: .default(Text("OK"), action: {
                    self.result = nil
                }))
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
