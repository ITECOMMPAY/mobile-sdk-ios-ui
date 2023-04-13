//
//  ContentView.swift
//  mobileSDK.SampleApp
//
//  Created by Ivan Krapivtsev on 18.08.2022.
//

import SwiftUI
import ecommpaySDK_Dev

struct MainScreen: View {
    @State var result: PaymentResult?
    @State var isPaymentPagePresented: Bool = false
    @State var paymentData: PaymentData = defaultPaymentData
    @State var token: String = ""

    @State var action: PaymentOptions.ActionType = .Sale
    @State var sdk = EcommpaySDK()

    @State var brandColorOverride: Color = .red
    @State var colorOverrideEnabled: Bool = false
    @State var isDarkThemeOn: Bool = false
    @State var hideScanningCards: Bool = false
    @State var overrideApiHosts: Bool = false {
        didSet {
            if !overrideApiHosts {
                resetUrls()
            }
        }
    }

    @State var additionalFieldsValues: [AdditionalFieldType: String] = [:]
    
    @State var recipientData = RecipientData()

    @State var showLogo: Bool = false

    @State var showVersion: Bool = false
    
    @State var simulateCrash: Bool = false

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
                actions
                basicSettings
                Group {
                    additionalFields
                    recipientInfoFields
                }
                threeDSecure
                visibilitySettings
                Group {
                    themeSettings
                    merchantLogo
                }
                forcePaymentMethods
                apiUrls
                applePayParams
                Group {
                    mockModeSetting
                    simulateCrashToggle
                }
            }
            .navigationBarTitle(Text("\(getBrandName()) \(getAppVersionString())"), displayMode: .inline)
            .toolbar {
                HStack {
                    Button("Info") {
                        showVersion.toggle()
                    }
                }
            }
            .alert(isPresented: $showVersion) {
                Alert(title: Text(
                    "SDK Version: \(getSDKVersionString())"
                    + "\nCore Version: \(getCoreVersionString())"
                ))
            }
        }
        .navigationViewStyle(.stack)
    }

    var visibilitySettings: some View {
        Section {
            HStack {
                Toggle("Hide saved wallets", isOn: $paymentData.hideSavedWallets)
            }
            HStack {
                Toggle("Hide scanning cards", isOn: $hideScanningCards)
            }
            HStack {
                Toggle("Hide success final page", isOn: $paymentData.hideSuccessFinalPage)
                    .accessibilityIdentifier("hidesuccessfinalpageCheckbox")
            }
            HStack {
                Toggle("Hide decline final page", isOn: $paymentData.hideDeclineFinalPage)
                    .accessibilityIdentifier("hidedeclinefinalpageCheckbox")
            }
        }
    }
    
    var actions: some View {
        Section(header: Text("Actions")) {
            Button("Sale") {
                presentPaymentPage(action: .Sale)
            }
            Button("Auth") {
                presentPaymentPage(action: .Auth)
            }
            Button("Verify") {
                presentPaymentPage(action: .Verify)
            }
            Button("Tokenize") {
                presentPaymentPage(action: .Tokenize)
            }
        }
    }

    var basicSettings: some View {
        Section(header: Text("Basic settings")) {
            HStack {
                Text("Project ID").foregroundColor(Color.secondary)
                Spacer()
                IntField(
                    label: "Required",
                    integer: $paymentData.projectId
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
                IntField(
                    label: "Required",
                    integer: $paymentData.paymentAmount
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
                Text("Token").foregroundColor(Color.secondary)
                Spacer()
                TextField("Card token", text: $token)
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
                            Text(fieldType.description).foregroundColor(Color.secondary)
                            Spacer()
                            TextField(
                                "value",
                                text: Binding<String>(get: {
                                    additionalFieldsValues[fieldType] ?? ""
                                }, set: { string in
                                    additionalFieldsValues[fieldType] = string.isEmpty ? nil : string
                                })
                            ).multilineTextAlignment(.trailing)
                        }
                    }
                }
                .navigationTitle("Additional Fields")
            }
        }
    }

    var recipientInfoFields: some View {
        Section {
            NavigationLink("Recipient Info") {
                RecipientInfoScreen(recipientInfo: $recipientData)
            }
        }
    }

    var threeDSecure: some View {
        Section {
            Toggle(isOn: $paymentData.sendThreeDSecParams, label: {
                Text("Enable 3d secure params")
            })
            NavigationLink("Edit 3ds params JSON") {
                ThreeDSecureScreen(threeDSecureInfo: paymentData.threeDSecParams, onSave: {
                    paymentData.threeDSecParams = $0
                })
            }
            NavigationLink("Recurrent Data") {
                RecurrentSettingsScreen(shouldSend: $paymentData.sendRecurrentData,
                                        recurrentData: $paymentData.recurrentData)
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
            if paymentData.forcePaymentMethod == .customValue {
                HStack {
                    Text("Custom Value").foregroundColor(Color.secondary)
                    Spacer()
                    TextField("Enter here", text: $paymentData.forcePaymentMethodCustomValue)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }

    @ViewBuilder
    var themeSettings: some View {
        Section(header: Text("Theme settings")) {
            Toggle("Override default", isOn: $colorOverrideEnabled)
            if colorOverrideEnabled {
                ColorPicker("Custom color", selection: $brandColorOverride)
            }
            Toggle("Dark theme", isOn: $isDarkThemeOn)
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
                        .accessibilityIdentifier("merchantIdTextField")

                    TextField("applePayDescription", text: $paymentData.applePayDescription)
                        .accessibilityIdentifier("applePayDescriptionTextField")

                    TextField("countryCode", text: $paymentData.applePayCountryCode)
                        .accessibilityIdentifier("countryCodeDescriptionTextField")
                }
                .toolbar {
                    HStack {
                        Button("Clear") {
                            paymentData.applePayDescription = ""
                            paymentData.applePayMerchantID = ""
                            paymentData.applePayCountryCode = ""
                        }
                        .accessibilityIdentifier("resetApplePaySettingsButton")
                        Button("Defaults") {
                            paymentData.applePayDescription = defaultPaymentData.applePayDescription
                            paymentData.applePayMerchantID = defaultPaymentData.applePayMerchantID
                            paymentData.applePayCountryCode = defaultPaymentData.applePayCountryCode
                        }
                        .accessibilityIdentifier("fillDefaultApplePaySettingsButton")
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
                        .accessibilityIdentifier(String(describing: type) + "MockModeRadioButton")
                }
            }
            .accessibilityIdentifier("mockModePicker")
        }
    }
    
    var simulateCrashToggle: some View {
        Section {
            Toggle("Simulate crash on PP", isOn: $simulateCrash)
        }
    }

    @ViewBuilder
    var paymentPage: some View {
        if isPaymentPagePresented, let paymentOptions = paymentOptions {
            sdk.getPaymentView(with: paymentOptions, completion: {
                result = $0
                token = result?.payment?.token ?? ""
                isPaymentPagePresented = false
            })
        } else {
            EmptyView()
        }
    }
    
    func presentPaymentPage(action: PaymentOptions.ActionType) {
        self.action = action
        sdk = EcommpaySDK(apiUrlString: paymentData.apiHost, socketUrlString: paymentData.wsApiHost)
        isPaymentPagePresented = true
        
        if simulateCrash {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                Array()[666]
            }
        }
    }

    var paymentOptions: PaymentOptions? {
        let paymentOptions = PaymentOptions(
            projectID: Int32(paymentData.projectId),
            paymentID: paymentData.paymentId,
            paymentAmount: Int64(paymentData.paymentAmount),
            paymentCurrency: paymentData.paymentCurrency,
            paymentDescription: paymentData.paymentDescription,
            customerID: paymentData.customerId,
            regionCode: !paymentData.regionCode.isEmpty ? paymentData.regionCode : nil,
            token: token.isEmpty ? nil : token
        )
        
        paymentOptions.action = action

        paymentOptions.additionalFields = additionalFieldsValues.map {
            AdditionalField(type: $0.key, value: $0.value)
        }
        
        paymentOptions.recipientInfo = RecipientInfo(
            walletId: recipientData.walletId,
            walletOwner: recipientData.walletOwner,
            pan: recipientData.pan,
            cardHolder: recipientData.cardHolder,
            country: recipientData.country,
            stateCode: recipientData.stateCode,
            city: recipientData.city,
            address: recipientData.address
        )

        if !paymentData.languageCode.isEmpty {
            paymentOptions.languageCode = paymentData.languageCode
        }

        paymentOptions.hideSavedWallets = paymentData.hideSavedWallets

        if paymentData.hideSuccessFinalPage {
            paymentOptions.addScreenDisplayMode(.hideSuccessFinalPage)
        }

        if paymentData.hideDeclineFinalPage {
            paymentOptions.addScreenDisplayMode(.hideDeclineFinalPage)
        }

        if paymentData.sendThreeDSecParams {
            paymentOptions.setThreeDSecureInfo(paymentData.threeDSecParams.sdkThreeDSecureInfo)
        }

        if paymentData.sendRecurrentData {
            let info = RecurrentInfo(
                register: paymentData.recurrentData.register,
                type: RecurrentType(rawValue: paymentData.recurrentData.type ?? ""),
                expiryDay: paymentData.recurrentData.expiryDay,
                expiryMonth: paymentData.recurrentData.expiryMonth,
                expiryYear: paymentData.recurrentData.expiryYear,
                period: RecurrentPeriod(rawValue: paymentData.recurrentData.period),
                interval: paymentData.recurrentData.interval,
                time: paymentData.recurrentData.time,
                startDate: paymentData.recurrentData.startDate,
                scheduledPaymentID: paymentData.recurrentData.scheduledPaymentID,
                amount: paymentData.recurrentData.amount
            )
            let schedule = paymentData.recurrentData.schedule
            info.schedule = schedule.count == 0 ? nil : schedule.map({ item in
                RecurrentInfoSchedule(date: item.date ?? "", amount: item.amount ?? 0)
            })
            paymentOptions.recurrentInfo = info
        }

        paymentOptions.mockModeType = paymentData.mockModeType

        if colorOverrideEnabled {
            paymentOptions.brandColor = UIColor(brandColorOverride)
        }

        paymentOptions.isDarkThemeOn = isDarkThemeOn

        switch paymentData.forcePaymentMethod {
        case .none:
            paymentOptions.forcePaymentMethod = nil
        case .customValue:
            paymentOptions.forcePaymentMethod = paymentData.forcePaymentMethodCustomValue
        default:
            paymentOptions.forcePaymentMethod = paymentData.forcePaymentMethod.rawValue
        }

        paymentOptions.signature = signature(
            paramsToSign: paymentOptions.paramsForSignature,
            secret: paymentData.secretKey
        )

        if showLogo {
            paymentOptions.logoImage = UIImage(named: "Logo")
        }

        if !paymentData.applePayMerchantID.isEmpty {
            let applePayOptions = PaymentOptions.ApplePayOptions(applePayMerchantID: paymentData.applePayMerchantID, applePayDescription: paymentData.applePayDescription, countryCode: paymentData.applePayCountryCode)
            paymentOptions.applePayOptions = applePayOptions
        }
        
        paymentOptions.hideScanningCards = hideScanningCards

        return paymentOptions
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

private func getAppVersionString() -> String {
    return "\(Bundle.main.releaseVersionNumber)(\(Bundle.main.buildVersionNumber))"
}

extension Bundle {
    var releaseVersionNumber: String {
        return (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    var buildVersionNumber: String {
        return (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }
}

struct IntField: View {
    let label: String
    @Binding var integer: Int

    var body: some View {
        let numberProxy = Binding<String>(
            get: { "\(integer)" },
            set: {
                if let value = Int($0) {
                    self.integer = value
                }
            }
        )

        return TextField(label, text: numberProxy)
    }
}

#if DEBUG

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

#endif
