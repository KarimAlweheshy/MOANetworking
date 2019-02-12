//
//  DumRequest.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation
import Networking

struct DumRequest: InternalRequest {
    static var regexPath: String = "/pay"
    static var responseType: Codable.Type = DumResponse.self
}
