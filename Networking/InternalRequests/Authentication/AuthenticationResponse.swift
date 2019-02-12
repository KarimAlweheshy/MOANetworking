//
//  AuthenticationResponse.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/6/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct AuthenticationResponse: Codable {
    public let authToken: String
    public let refreshToken: String
    
    public init(authToken: String, refreshToken: String) {
        self.authToken = authToken
        self.refreshToken = refreshToken
    }
}
