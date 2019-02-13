//
//  DumNetorking.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit
import Networking

struct DumNetworking: NetworkingType {
    let modules: [ModuleType.Type]
    
    init(modules: [ModuleType.Type]) {
        self.modules = modules
    }
    
    func execute<T: Codable>(request: RemoteRequest,
                             completionHandler: @escaping (Result<T>) -> Void) {
    }
}
