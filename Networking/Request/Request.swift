//
//  Request.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public protocol Request {
    static var regexPath: String { get }
    static var responseType: Codable.Type { get }
    
    /** Implement this if your regexPath is different than your path */
    func path() -> String
}

extension Request {
    public func path() -> String { return Self.regexPath }
}
