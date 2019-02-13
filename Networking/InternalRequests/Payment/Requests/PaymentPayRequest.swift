//
//  PaymentRefundRequest.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/8/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct PaymentPayRequestBody: Codable {
    public let amount: Double?
    
    public init(amount: Double?) {
        self.amount = amount
    }
}

public struct PaymentPayRequest: InternalRequest {
    public static var responseType: Any.Type = PaymentResponse.self
    
    fileprivate let data: PaymentPayRequestBody
    
    public init(data: PaymentPayRequestBody) {
        self.data = data
    }
}
