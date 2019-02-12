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
    func register(module: Module.Type) {}
    func execute<T>(request: InternalRequest, presentationBlock: ((UIViewController, (() -> Void)?) -> Void)?, dismissBlock: ((UIViewController, (() -> Void)?) -> Void)?, completionHandler: @escaping (Result<T>) -> Void) where T : Decodable, T : Encodable {}
    func execute<T>(request: InternalRequest, completionHandler: @escaping (Result<T>) -> Void) where T : Decodable, T : Encodable {}
    func execute<T>(request: RemoteRequest, completionHandler: @escaping (Result<T>) -> Void) where T : Decodable, T : Encodable {}
}
