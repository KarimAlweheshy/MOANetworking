//
//  EmailDetailsRequest.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct EmailDetailsRequestBody: Codable {
    public let emailID: UUID
    
    public init(emailID: UUID) {
        self.emailID = emailID
    }
}

public struct EmailDetailsRequest: InternalRequest {
    public static var regexPath = "^\\/emails\\/([^\\/]+?)\\/?$"
    public static var responseType: Codable.Type = EmailResponse.self
    
    public let data: EmailDetailsRequestBody
    
    public init(data: EmailDetailsRequestBody) {
        self.data = data
    }
    
    public func path() -> String {
        return "/emails/\(data.emailID.uuidString)"
    }
}
