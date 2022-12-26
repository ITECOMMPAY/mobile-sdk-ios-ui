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
    func createSavedCardSaleRequest(cvv: String, accountId: Int64, customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = SavedCardSaleRequest(cvv: cvv, accountId: accountId)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return PayRequestWrapper(coreRequest: request)
    }

    func createNewCardSaleRequest(cvv: String,
                                  pan: String,
                                  year: Int32,
                                  month: Int32,
                                  cardHolder: String,
                                  saveCard: Bool,
                                  customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = NewCardSaleRequest(cvv: cvv, pan: pan, expiryDate: CardDate(month: month, year: year), cardHolder: cardHolder, saveCard: saveCard)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return PayRequestWrapper(coreRequest: request)
    }

    func createApplePaySaleRequest(token: String, customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        #if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
        let request = ApplePaySaleRequest(token: debugToken)
        #else
        let request = ApplePaySaleRequest(token: token)
        #endif
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
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
        cardHolder: String,
        customerFields: [FieldValue]?
    ) -> mobileSDK_UI.PayRequest {
        let request = CardTokenizeRequest(pan: pan, expiryDate: CardDate(month: month, year: year), cardHolder: cardHolder)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return PayRequestWrapper(coreRequest: request)
    }
    
    func createTokenizeSaleRequest(cvv: String, customerFields: [FieldValue]?) -> mobileSDK_UI.PayRequest {
        let request = CardSaleTokenizeRequest(cvv: cvv)
        request.customerFields = customerFields?.map({ value in
            return MsdkCore.CustomerFieldValue(name: value.name, value: value.value)
        })
        return PayRequestWrapper(coreRequest: request)
    }
}

internal struct PayRequestWrapper: mobileSDK_UI.PayRequest {
    let coreRequest: MsdkCore.PayRequest
}

#if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
private let debugToken = "{\"paymentData\":{\"version\":\"EC_v1\",\"data\":\"K3WNroItKkhxF2Uo4cnMitXD6C1OLkUGcuupkSDnt2VVtLhvDX7LIAFSodcosloUoIbew0ImXvN5XSr3AxPSHdQUxVNTSFHRIjAhyoN8YX\\/\\/y5xQiilbIm4VRxeAR4m2pO2SBmS7MLdJI338eUek\\/kAT++P\\/UAmnVwNICUAccawGVt\\/FiJtC6QK3POL50fLqgcKd9wpXX2Yhz1MMI6p4qpqGeJgHItm4RvkBYgsNg4nBAD9R4NHSF3zD8AjtkNJAw9i15AYqz8yKXa3yYjhzLXXqasWYpubFN8fPLIpPmbRhSzLpLQfO308+swN6gp\\/BZMGlWrzhc+mGrViesRXOiUXWW1iMri2F6e3VEjjLTdE2kFnz5zIZZNnq3UKI+zc9xFe1f62qwrKO2MfmvF9AikHhFvEzgAV96f0u8lkzC7w=\",\"signature\":\"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\\/JJxE+T5O8n5sT2KGw\\/orv9LkswDwYDVR0TAQH\\/BAUwAwEB\\/zAfBgNVHSMEGDAWgBS7sN6hWDOImqSKmd6+veuv2sskqzA3BgNVHR8EMDAuMCygKqAohiZodHRwOi8vY3JsLmFwcGxlLmNvbS9hcHBsZXJvb3RjYWczLmNybDAOBgNVHQ8BAf8EBAMCAQYwEAYKKoZIhvdjZAYCDgQCBQAwCgYIKoZIzj0EAwIDZwAwZAIwOs9yg1EWmbGG+zXDVspiv\\/QX7dkPdU2ijr7xnIFeQreJ+Jj3m1mfmNVBDY+d6cL+AjAyLdVEIbCjBXdsXfM4O5Bn\\/Rd8LCFtlk\\/GcmmCEm9U+Hp9G5nLmwmJIWEGmQ8Jkh0AADGCAYkwggGFAgEBMIGGMHoxLjAsBgNVBAMMJUFwcGxlIEFwcGxpY2F0aW9uIEludGVncmF0aW9uIENBIC0gRzMxJjAkBgNVBAsMHUFwcGxlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MRMwEQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUwIITDBBSVGdVDYwCwYJYIZIAWUDBAIBoIGTMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMDYyMDA3MTcxM1owKAYJKoZIhvcNAQk0MRswGTALBglghkgBZQMEAgGhCgYIKoZIzj0EAwIwLwYJKoZIhvcNAQkEMSIEIIeziz380mzS7E+\\/8EGwprJBO2MCMRO3is6ifGNfScSyMAoGCCqGSM49BAMCBEgwRgIhALeUDOaM0ttMdgLdfiPwJHiIXyN9EB5Q0rP2aFW\\/Qx1dAiEAnFAdcFxj5ciMUbBWtgrkxcZ4fO\\/OJl7UQ8bIQhI5MngAAAAAAAA=\",\"header\":{\"ephemeralPublicKey\":\"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEATltODOP+Cibx1mWhvwPzIGxdIqoegf6jSkAeDxI4QRjhsmOurKHAjn3LX2zSGjSoBvkMAcFhBDMQVjm+Qnahg==\",\"publicKeyHash\":\"u\\/YVR\\/kRSXxz8ly7+F9wmjQtE0CTSDumd2xZGFvXlqo=\",\"transactionId\":\"7ed2929d8b6611f0dc8b2d909b247f36786989c8139636297c8eb1e315b98bbb\"}}}"
#endif
