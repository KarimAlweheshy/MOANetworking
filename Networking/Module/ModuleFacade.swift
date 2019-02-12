//
//  ModuleFacade.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/6/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public protocol ModuleFacade {
    static var requestType: [InternalRequest.Type] { get }
}

extension ModuleFacade {
    static public func contains(request: InternalRequest) -> Bool {
        return requestType.contains { $0 == type(of: request) }
    }
}
