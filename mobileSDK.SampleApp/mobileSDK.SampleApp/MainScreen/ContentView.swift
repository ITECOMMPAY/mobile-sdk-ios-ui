//
//  ContentView.swift
//  mobileSDK.SampleApp
//
//  Created by Ivan Krapivtsev on 18.08.2022.
//

import SwiftUI
import ecommpaySDK

struct ContentView: View {
    @State var result: PaymentResult?
    @State var isPaymentPagePresented: Bool = false
    @State var paymentData: PaymentData = defaultPaymentData

    @State var sdk = EcommpaySDK()

    @State var brandColorOverride: Color = .red
    @State var colorOverrideEnabled: Bool = false
    @State var overrideApiHosts: Bool = false {
        didSet {
            if !overrideApiHosts {
                resetUrls()
            }
        }
    }

    @State var additionalFieldsValues: [AdditionalFieldType: String] = [:]

    @State var showLogo: Bool = false

    var body: some View {
        mainPage
            .overlay(paymentPage)
            .alert(isPresented: .constant(result != nil)) {
                alert!
            }
    }

    var mainPage: some View {
        NavigationView {
            Form {
                basicSettings
                additionalFields
                savedWalletsVisibility
                brandColor
                merchantLogo
                forcePaymentMethods
                apiUrls
                applePayParams
                mockModeSetting
            }
            .navigationTitle("\(getBrandName()) SDK")
            .toolbar {
                Button("Sale") {
                    sdk = EcommpaySDK(apiUrlString: paymentData.apiHost, socketUrlString: paymentData.wsApiHost)
                    isPaymentPagePresented = true
                }
            }
        }
    }

    var savedWalletsVisibility: some View {
        Section {
            HStack {
                Toggle("Hide saved wallets", isOn: $paymentData.hideSavedWallets)
            }
        }
    }

    var basicSettings: some View {
        Section(header: Text("Basic settings")) {
            HStack {
                Text("Project ID").foregroundColor(Color.secondary)
                Spacer()
                TextField(
                    "Required",
                    value: $paymentData.projectId,
                    formatter: NumberFormatter()
                ).multilineTextAlignment(.trailing)
            }
            HStack {
                Text("Secret key").foregroundColor(Color.secondary)
                Spacer()
                TextField("Required", text: $paymentData.secretKey)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                Text("Payment ID").foregroundColor(Color.secondary)
                Spacer()
                TextField("Required", text: $paymentData.paymentId)
                    .multilineTextAlignment(.trailing)
                Button {
                    paymentData.paymentId = getUniquePaymentID()
                } label: {
                    Text("⟳")
                }
            }
            HStack {
                Text("Payment Amount").foregroundColor(Color.secondary)
                Spacer()
                TextField(
                    "Required",
                    value: $paymentData.paymentAmount,
                    formatter: NumberFormatter()
                ).multilineTextAlignment(.trailing)
            }
            HStack {
                Text("Payment Currency").foregroundColor(Color.secondary)
                Spacer()
                TextField("Required", text: $paymentData.paymentCurrency)
                    .multilineTextAlignment(.trailing)
            }
            VStack(alignment: .leading) {
                Text("Payment Description").foregroundColor(Color.secondary)
                Spacer()
                TextEditor(text: $paymentData.paymentDescription)
            }
            HStack {
                Text("Customer ID").foregroundColor(Color.secondary)
                Spacer()
                TextField("Required", text: $paymentData.customerId)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                Text("Language code").foregroundColor(Color.secondary)
                Spacer()
                TextField("Optional", text: $paymentData.languageCode)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                Text("Region code").foregroundColor(Color.secondary)
                Spacer()
                TextField("Mandatory for Apple", text: $paymentData.regionCode)
                    .multilineTextAlignment(.trailing)
            }
        }
    }

    var additionalFields: some View {
        Section {
            NavigationLink("Additional Fields") {
                Form {
                    ForEach(AdditionalFieldType.allCases) { fieldType in
                        HStack {
                            Text(fieldType.rawValue).foregroundColor(Color.secondary)
                            Spacer()
                            TextField(
                                "value",
                                text: Binding<String>(get: {
                                    additionalFieldsValues[fieldType] ?? ""
                                }, set: { string in
                                    additionalFieldsValues[fieldType] = string
                                })
                            ).multilineTextAlignment(.trailing)
                        }
                    }
                }
                .navigationTitle("Additional Fields")
            }
        }
    }

    var forcePaymentMethods: some View {
        Section {
            Picker("Force payment method", selection: $paymentData.forcePaymentMethod) {
                ForEach(ForcePaymentMethods.allCases) { method in
                    Text(method.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    var brandColor: some View {
        Section(header: Text("Brand color")) {
            Toggle("Override default", isOn: $colorOverrideEnabled)
            if colorOverrideEnabled {
                ColorPicker("Custom color", selection: $brandColorOverride)
            }
        }
    }

    var merchantLogo: some View {
        Section {
            Toggle("Merchant Logo", isOn: $showLogo)
        }
    }

    var apiUrls: some View {
        Section(header: Text("API URLs")) {
            Toggle("Override default", isOn: $overrideApiHosts)
            if overrideApiHosts {
                HStack {
                    Text("Host").foregroundColor(Color.secondary)
                    Spacer()
                    TextField("Required", text: $paymentData.apiHost)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Socket").foregroundColor(Color.secondary)
                    Spacer()
                    TextField("Required", text: $paymentData.wsApiHost)
                        .multilineTextAlignment(.trailing)
                }
                VStack {
                    Button {
                        resetUrls()
                    } label: {
                        Text("Reset to default")
                    }
                }
            }
        }
    }

    func resetUrls() {
        paymentData.wsApiHost = defaultPaymentData.wsApiHost
        paymentData.apiHost = defaultPaymentData.apiHost
    }

    var applePayParams: some View {
        Section {
            NavigationLink("Apple Pay Params") {
                Form {
                    TextField("applePayMerchantID", text: $paymentData.applePayMerchantID)

                    TextField("applePayDescription", text: $paymentData.applePayDescription)

                    TextField("countryCode", text: $paymentData.applePayCountryCode)
                }
                .toolbar {
                    HStack {
                        Button("Clear") {
                            paymentData.applePayDescription = ""
                            paymentData.applePayMerchantID = ""
                            paymentData.applePayCountryCode = ""
                        }
                        Button("Defaults") {
                            paymentData.applePayDescription = defaultPaymentData.applePayDescription
                            paymentData.applePayMerchantID = defaultPaymentData.applePayMerchantID
                            paymentData.applePayCountryCode = defaultPaymentData.applePayCountryCode
                        }
                    }
                }
                .navigationTitle("Apple Pay Params")
            }
        }
    }

    var mockModeSetting: some View {
        Section {
            Picker("Mock Mode Setting", selection: $paymentData.mockModeType) {
                ForEach(MockModeType.allCases) { type in
                    Text(String(describing: type))
                }
            }
        }
    }

    @ViewBuilder
    var paymentPage: some View {
        if isPaymentPagePresented, let paymentOptions = paymentOptions {
            sdk.getPaymentView(with: paymentOptions, completion: {
                result = $0
                isPaymentPagePresented = false
            })
        } else {
            EmptyView()
        }
    }

    var paymentOptions: PaymentOptions? {
        guard let projectId = paymentData.projectId
        else {
            return nil
        }
        let paymentOptions = PaymentOptions(
            projectID: projectId,
            paymentID: paymentData.paymentId,
            paymentAmount: paymentData.paymentAmount,
            paymentCurrency: paymentData.paymentCurrency,
            paymentDescription: paymentData.paymentDescription,
            customerID: paymentData.customerId,
            regionCode: !paymentData.regionCode.isEmpty ? paymentData.regionCode : nil
        )

        paymentOptions.additionalFields = additionalFieldsValues.map {
            AdditionalField(type: $0.key, value: $0.value)
        }

        if !paymentData.languageCode.isEmpty {
            paymentOptions.paymentInfo.languageCode = paymentData.languageCode
        }

        paymentOptions.paymentInfo.hideSavedWallets = paymentData.hideSavedWallets

        paymentOptions.mockModeType = paymentData.mockModeType

        if colorOverrideEnabled {
            paymentOptions.brandColorOverride = brandColorOverride
        }

        if paymentData.forcePaymentMethod != .none {
            paymentOptions.paymentInfo.forcePaymentMethod = paymentData.forcePaymentMethod.rawValue
        }

        paymentOptions.paymentInfo.signature = signature(
            paramsToSign: paymentOptions.paymentInfo.getParamsForSignature(),
            secret: paymentData.secretKey
        )

        if showLogo {
            paymentOptions.logoImage = UIImage(named: "Logo")
        }

        if !paymentData.applePayMerchantID.isEmpty {
            let applePayOptions = PaymentOptions.ApplePayOptions(applePayMerchantID: paymentData.applePayMerchantID, applePayDescription: paymentData.applePayDescription, countryCode: paymentData.applePayCountryCode)
            paymentOptions.applePayOptions = applePayOptions
        }

        return paymentOptions
    }

    var alert: Alert? {
        if let result = result {
            return Alert(
                title: Text(String(describing: result.status.rawValue) + " " + (result.error?.code.rawValue ?? "")),
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
