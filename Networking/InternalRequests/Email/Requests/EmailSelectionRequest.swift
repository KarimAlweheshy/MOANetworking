//
//  EmailSelectionRequest.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct EmailSelectionRequest: InternalRequest {
    public static var regexPath = "emails"
    public static var responseType: Codable.Type = EmailResponse.self
    
    public let data: EmailListRequestBody
    
    public init(data: EmailListRequestBody) {
        self.data = data
    }
}
