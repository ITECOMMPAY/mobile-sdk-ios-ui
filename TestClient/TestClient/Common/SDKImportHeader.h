//
//  SDKImportHeader.h
//  TestClient
//
//  Created by Ivan Krapivev on 29.03.2022.
//  Copyright © 2022 Ecommpay. All rights reserved.
//

#ifndef SDKImportHeader_h
#define SDKImportHeader_h

    #if ODTSDK
        #import "TestClient_1D3-Swift.h"
        #import "ODTSDK/ODTSDK.h"
        #define SDKFacadeType ODTPaySDK
        #define PaymentResulType ODTPaymentResult
        #define CallbackDelegate ODTPaymentDelegate
    #elif JETPAY
        #import "TestClient_Jetpay-Swift.h"
        #import "jetpayhostsSDK/JetpayhostsSDK.h"
        #define SDKFacadeType JetpayHostsSDK
        #define PaymentResulType JetpayHostsPaymentResult
        #define CallbackDelegate JetpayHostsCallback
    #else
        #import "TestClient-Swift.h"
        #import "ecommpaySDK/ecommpaySDK-Swift.h"
        #define SDKFacadeType EcommpaySDK
        #define PaymentResulType ECPPaymentResult
        #define CallbackDelegate ECMPCallback
    #endif

#endif /* SDKImportHeader_h */
