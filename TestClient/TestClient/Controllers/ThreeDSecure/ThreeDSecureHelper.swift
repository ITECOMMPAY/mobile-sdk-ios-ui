//
//  ThreeDSecureHelper.swift
//  TestClient
//
//  Created by Виталий Морозов on 30.04.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import Foundation

class ThreeDSecureHelper {
    
    static func getVO() -> [ThreeDSecureVO] {
        var vo: [ThreeDSecureVO] = []
        let paymentMerchantRiskJson = """
                                        {
                                            "payment": {
                                                "reorder": "01",
                                                "preorder_purchase": "01",
                                                "preorder_date": "01-10-2020",
                                                "challenge_indicator": "01",
                                                "challenge_window": "01",
                                                "gift_card": {
                                                    "amount": 12345,
                                                    "currency": "USD",
                                                    "count": 1
                                                }
                                            }
                                        }
                                      """
        
        let customerAccountInfo = """
                                    {
                                        "customer": {
                                            "address_match": "Y",
                                            "home_phone": "79105211111",
                                            "work_phone": "74955211111",
                                            "account": {
                                                "additional": "gamer12345",
                                                "age_indicator": "01",
                                                "date": "01-10-2019",
                                                "change_indicator": "01",
                                                "change_date": "01-10-2019",
                                                "pass_change_indicator": "01",
                                                "pass_change_date": "01-10-2019",
                                                "purchase_number": 12,
                                                "provision_attempts": 16,
                                                "activity_day": 22,
                                                "activity_year": 222,
                                                "payment_age_indicator": "01",
                                                "payment_age": "01-10-2019",
                                                "suspicious_activity": "01",
                                                "auth_method": "01",
                                                "auth_time": "01-10-201913:12",
                                                "auth_data": "login_0102"
                                            }
                                        }
                                    }
                                  """
        
        let customerShipping = """
                                {
                                    "customer": {
                                        "shipping": {
                                            "type": "01",
                                            "delivery_time": "01",
                                            "delivery_email": "test@gmail.com",
                                            "address_usage_indicator": "01",
                                            "address_usage": "01-10-2019",
                                            "city": "Moscow",
                                            "country": "RU",
                                            "address": "Lenina street 12",
                                            "postal": "109111",
                                            "region_code": "MOW",
                                            "name_indicator": "01"
                                        }
                                    }
                                }
                               """
        
        let customerMpiResult = """
                                    {
                                        "customer": {
                                            "mpi_result": {
                                                "acs_operation_id": "00000000-0005-5a5a-8000-016d3ea31d54",
                                                "authentication_flow": "01",
                                                "authentication_timestamp": "201812141050"
                                            }
                                        }
                                    }
                                  """
        
        let billingRegionCode = """
                                  {
                                        "billing_region_code":"ABC"
                                  }
                                """
        
        vo.append(ThreeDSecureVO(type: "payment_merchant_risk", defaultJson: paymentMerchantRiskJson))
        vo.append(ThreeDSecureVO(type: "customer_account_info", defaultJson: customerAccountInfo))
        vo.append(ThreeDSecureVO(type: "customer_shipping", defaultJson: customerShipping))
        vo.append(ThreeDSecureVO(type: "customer_mpi_result", defaultJson: customerMpiResult))
        vo.append(ThreeDSecureVO(type: "billing_region_code", defaultJson: billingRegionCode))
        
        return vo
    }
}
