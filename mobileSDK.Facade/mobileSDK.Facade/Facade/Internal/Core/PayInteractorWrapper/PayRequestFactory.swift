//
//  PayRequestFactory.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

#if !DEVELOPMENT
@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore
#else
import mobileSDK_UI
import MsdkCore
#endif

class PayRequestFactory: mobileSDK_UI.PayRequestFactory {
    func createSavedCardSaleRequest(
        cvv: String,
        accountId: Int64,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        let request = SavedCardSaleRequest(cvv: cvv, accountId: accountId)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }
    
    func createSavedCardAuthRequest(
        cvv: String,
        accountId: Int64,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        let request = SavedCardAuthRequest(cvv: cvv, accountId: accountId)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createNewCardSaleRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String,
        saveCard: Bool,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        let request = NewCardSaleRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            saveCard: saveCard
        )

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }
    
    func createNewCardAuthRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String,
        saveCard: Bool,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        let request = CardAuthRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            saveCard: saveCard
        )

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createTokenizeSaleRequest(
        cvv: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        let request = CardSaleTokenizeRequest(cvv: cvv)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createTokenizeAuthRequest(
        cvv: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        let request = CardAuthTokenizeRequest(cvv: cvv)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createApplePaySaleRequest(
        token: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        
        #if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
        let request = ApplePaySaleRequest(token: debugToken)
        #else
        let request = ApplePaySaleRequest(token: token)
        #endif

        request.recipientInfo = recipientInfo?.coreRecipientInfo
        
        return PayRequestWrapper(coreRequest: request)
    }

    func createApplePayAuthRequest(
        token: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        #if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
        let request = ApplePayAuthRequest(token: debugToken)
        #else
        let request = ApplePayAuthRequest(token: token)
        #endif

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createAPSSaleRequest(methodCode: String) -> mobileSDK_UI.PayRequest {
        PayRequestWrapper(coreRequest: ApsSaleRequest(methodCode: methodCode))
    }

    func createPaymentRestoreRequest(methodCode: String) -> mobileSDK_UI.PayRequest {
        PayRequestWrapper(coreRequest: PaymentRestoreRequest())
    }
    
    func createTokenizeRequest(
        pan: String,
        month: Int32,
        year: Int32,
        cardHolder: String
    ) -> mobileSDK_UI.PayRequest {
        
        let request = CardTokenizeRequest(pan: pan, expiryDate: CardDate(month: month, year: year), cardHolder: cardHolder)

        return PayRequestWrapper(coreRequest: request)
    }

    func createVerifyCardRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String
    ) -> mobileSDK_UI.PayRequest {

        let request = CardVerifyRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder
        )

        return PayRequestWrapper(coreRequest: request)
    }

    func createVerifyApplePayRequest(
        token: String
    ) -> mobileSDK_UI.PayRequest {

        #if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
        let request = ApplePayVerifyRequest(token: debugToken)
        #else
        let request = ApplePayVerifyRequest(token: token)
        #endif

        return PayRequestWrapper(coreRequest: request)
    }
}

internal struct PayRequestWrapper: mobileSDK_UI.PayRequest {
    let coreRequest: MsdkCore.PayRequest

    func fillCustomerFields(customerFields: [FieldValue]) {
        coreRequest.customerFields = customerFields.map {
            MsdkCore.CustomerFieldValue(name: $0.name, value: $0.value)
        }
    }
}

#if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
private let debugToken = "{\"data\":\"iI0oAvRacVFFegtTVNQ4qnxyiQveklS3ssDNpkoBwk0finbdE5FkfWemZP+JDh3c19fPD1R4c0CF7HLgmOnoPKDL1qI5BWK3hDOxRH+8a\\/9t04oam1ujtMdDhf0WZEc3eysE6vUjJkGeaDTifJZMWACck6YIYlMUcSfIOjDrSeDms1i83I9F2wHx3IUwVVG10BKa3LNrdQ691DTtv3\\/1QyCAbaMrBdel44XAVGKf9a4KdjmAwOP\\/gPM5U2pNNh3VheCu8EEVOUex8sj5rAM4l\\/lfRaMc0WZms1jWftYyGnsiGUM7FUfkSt\\/dTSmjwy8cdwwBZr1\\/uRiNc\\/QEX8qywYIKYa8EL2AwGKhWm1+70XB9XtNTsbe+dUXcejcroP2JZBT8VLDm7XjmhH7GlA==\",\"signature\":\"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\\/JJxE+T5O8n5sT2KGw\\/orv9LkswDwYDVR0TAQH\\/BAUwAwEB\\/zAfBgNVHSMEGDAWgBS7sN6hWDOImqSKmd6+veuv2sskqzA3BgNVHR8EMDAuMCygKqAohiZodHRwOi8vY3JsLmFwcGxlLmNvbS9hcHBsZXJvb3RjYWczLmNybDAOBgNVHQ8BAf8EBAMCAQYwEAYKKoZIhvdjZAYCDgQCBQAwCgYIKoZIzj0EAwIDZwAwZAIwOs9yg1EWmbGG+zXDVspiv\\/QX7dkPdU2ijr7xnIFeQreJ+Jj3m1mfmNVBDY+d6cL+AjAyLdVEIbCjBXdsXfM4O5Bn\\/Rd8LCFtlk\\/GcmmCEm9U+Hp9G5nLmwmJIWEGmQ8Jkh0AADGCAYgwggGEAgEBMIGGMHoxLjAsBgNVBAMMJUFwcGxlIEFwcGxpY2F0aW9uIEludGVncmF0aW9uIENBIC0gRzMxJjAkBgNVBAsMHUFwcGxlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MRMwEQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUwIITDBBSVGdVDYwCwYJYIZIAWUDBAIBoIGTMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDEwOTA4MjAyN1owKAYJKoZIhvcNAQk0MRswGTALBglghkgBZQMEAgGhCgYIKoZIzj0EAwIwLwYJKoZIhvcNAQkEMSIEIA81F44v9t9xB2FYusPMdVFTdOb2Vxz9Z7OtMWA6GYdBMAoGCCqGSM49BAMCBEcwRQIhANUZgJNPigKD4T+Z81cTnLRzNZx8XOODN7Fg8Vxmu6+yAiAJnCBUxJBBfl0qAvooIRd4of1PHGSR9\\/UZRVvxEVGL7gAAAAAAAA==\",\"header\":{\"publicKeyHash\":\"u\\/YVR\\/kRSXxz8ly7+F9wmjQtE0CTSDumd2xZGFvXlqo=\",\"ephemeralPublicKey\":\"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEtzf0JcxtGJq5fHIL\\/iL\\/nOCdplDgMpjlBqsDqS6kHbjfoauO2aZ7A2ND5roibeB4Q8T0i8dP5QnFh0QnjcBoAg==\",\"transactionId\":\"ffb5f05256a955a3cae36274d309c7ea40aa3650746d9e5115c4687cb5bb6327\"},\"version\":\"EC_v1\"}"
#endif
