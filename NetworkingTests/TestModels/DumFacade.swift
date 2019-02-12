//
//  DumFacade.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation
import Networking

struct DumFacade: ModuleFacade {
    static var host: ModuleHost = .authentication
    static var requestType: [InternalRequest.Type] = [DumRequest.self]
    static var requiredAuthentication: Bool = false
}
