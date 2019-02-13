//
//  NetworkingRequest.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/6/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

/// Should be implmented only inside this Module.
/// Unfortunatly we can't have open protocols... Just yet.
/// https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20170213/032370.html
public protocol InternalRequest {
    static var responseType: Any.Type { get }
}
