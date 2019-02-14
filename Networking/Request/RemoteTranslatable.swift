//
//  RemoteTranslatable.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/14/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

/// Can be implemented by an InternalRequest to consume remote requests.
///
/// Should be useful for deeplink translation or JSON navigation
protocol RemoteTranslatable {
    /// Returns an instance of self if it can translate the URL to itself.  
    static func == (lhs: Self, rhs: URL) -> Self?
}
