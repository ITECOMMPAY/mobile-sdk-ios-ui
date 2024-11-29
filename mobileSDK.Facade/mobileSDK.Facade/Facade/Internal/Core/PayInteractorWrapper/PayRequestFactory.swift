//
//  PayRequestFactory.swift
//  ecommpaySDK
//
//  Created by Ivan Krapivtsev on 25.07.2022.
//

#if !DEVELOPMENT
internal import mobileSDK_UI
internal import MsdkCore
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
        storedCardType: Int32?,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        

        let request = NewCardSaleRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            saveCard: saveCard,
            storedCardType: storedCardType != nil ? StoredCardType.companion.from(value: KotlinInt(int: storedCardType!)) : nil
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
        storedCardType: Int32?,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {

        let request = CardAuthRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            saveCard: saveCard,
            storedCardType: storedCardType != nil ? StoredCardType.companion.from(value: KotlinInt(int: storedCardType!)) : nil
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
        cardHolder: String,
        storedCardType: Int32?
    ) -> mobileSDK_UI.PayRequest {

        let request = CardVerifyRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            storedCardType: storedCardType != nil ? StoredCardType.companion.from(value: KotlinInt(int: storedCardType!)) : nil
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
private let debugToken = "{\"data\":\"nKkRH0nc1SpeV11LSL9wZxBgBcDq9bsrj2eGgrXxWFo3WUbYAUPxbADqvHlU+T0MI3JhyVZ\\/canIKFqd5mQQ7AqKBX4s5Ax1iG\\/wgiGn1CJ0Il3CjoPs85rlvNPAqWzjQolMlRSmmGHDjppZCGzQvl53jPwECuFARHGQ5HhsDUi1vFnXbf88dq\\/J1ZUlDI6hTnikam1l53u81bYngVSQ0qKQgCI4nalTJU1m\\/n6v8CFLTeTxAs9sGry1PQQ8UrgndAeDUw7ixJCN2zrEqK\\/yRpv\\/LpaRzwYrVFRhiNWnEfyeCzCMzQNIpsnqkoBDoInHoUuX+qSYsjmf\\/mK5HvrJxuDCEw\\/koubthAx9vhZ4ZrvmQoDaGk4AdPZDL7CrhIy3PmoPXYgkdmCE\\/llhEXs=\",\"signature\":\"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\\/JJxE+T5O8n5sT2KGw\\/orv9LkswDwYDVR0TAQH\\/BAUwAwEB\\/zAfBgNVHSMEGDAWgBS7sN6hWDOImqSKmd6+veuv2sskqzA3BgNVHR8EMDAuMCygKqAohiZodHRwOi8vY3JsLmFwcGxlLmNvbS9hcHBsZXJvb3RjYWczLmNybDAOBgNVHQ8BAf8EBAMCAQYwEAYKKoZIhvdjZAYCDgQCBQAwCgYIKoZIzj0EAwIDZwAwZAIwOs9yg1EWmbGG+zXDVspiv\\/QX7dkPdU2ijr7xnIFeQreJ+Jj3m1mfmNVBDY+d6cL+AjAyLdVEIbCjBXdsXfM4O5Bn\\/Rd8LCFtlk\\/GcmmCEm9U+Hp9G5nLmwmJIWEGmQ8Jkh0AADGCAYgwggGEAgEBMIGGMHoxLjAsBgNVBAMMJUFwcGxlIEFwcGxpY2F0aW9uIEludGVncmF0aW9uIENBIC0gRzMxJjAkBgNVBAsMHUFwcGxlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MRMwEQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUwIITDBBSVGdVDYwCwYJYIZIAWUDBAIBoIGTMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDUxODA3NDc0MVowKAYJKoZIhvcNAQk0MRswGTALBglghkgBZQMEAgGhCgYIKoZIzj0EAwIwLwYJKoZIhvcNAQkEMSIEIO8D26aitPuw8FsebSGCNkL2uFRz8r5t6E1vUrqli5lJMAoGCCqGSM49BAMCBEcwRQIhAMXYG3WCYU2GrNn6APoUam4cQ7Ldcxd27PRI0TEBPC0TAiAPhVZ6nt7g7tMlrC5FnuFYIrwrU717ukYCx6MVKYzrYAAAAAAAAA==\",\"header\":{\"publicKeyHash\":\"4yVPlUiiAI8ILvSE2zeLzuO\\/yp29KplPHdzka9CpjEQ=\",\"ephemeralPublicKey\":\"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEIC0NHaV822hJCLSzbsjSRu7tTjaoRP9Lhkhw2Z9HnSAFD93JLrNyk\\/hl1z1L\\/dGzscQD3Mf4FR4oSFKm4hYE8Q==\",\"transactionId\":\"a6f7968eb89090e416d3818ae88c970ca14be60bc4df69c7c7faf88441324387\"},\"version\":\"EC_v1\"}"
#endif
