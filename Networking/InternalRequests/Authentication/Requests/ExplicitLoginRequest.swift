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
    public static var responseType: Any.Type = AuthenticationResponse.self
    
    public let data: ExplicitLoginRequestBody
    
    public init(data: ExplicitLoginRequestBody) {
        self.data = data
    }
}

// MARK: - RemoteTranslatable
extension ExplicitLoginRequest: RemoteTranslatable {
    static func == (lhs: ExplicitLoginRequest, rhs: URL) -> ExplicitLoginRequest? {
        guard rhs.pathComponents.first == "auth" else { return nil }
        guard rhs.pathComponents.count > 2, rhs.pathComponents[1] == "login" else { return nil }
        guard let components = URLComponents(url: rhs, resolvingAgainstBaseURL: false) else { return nil }
        let email = components.queryItems?.first { $0.name == "email" }?.value
        let password = components.queryItems?.first { $0.name == "password" }?.value
        return ExplicitLoginRequest(data: ExplicitLoginRequestBody(email: email, password: password))
    }
}
