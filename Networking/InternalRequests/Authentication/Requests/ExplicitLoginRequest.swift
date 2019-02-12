//
//  ExplicitLoginRequest.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/6/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct ExplicitLoginRequestBody: Codable {
    public let email: String?
    public let password: String?
    
    public init(email: String?, password: String?) {
        self.email = email
        self.password = password
    }
}

public struct ExplicitLoginRequest: InternalRequest {
    
    public static let regexPath = "/login"
    public static let responseType: Codable.Type = AuthenticationResponse.self
    
    public let data: ExplicitLoginRequestBody
    
    public init(data: ExplicitLoginRequestBody) {
        self.data = data
    }
}
