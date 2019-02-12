//
//  Networking.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit

public protocol NetworkingType {
    func register(module: Module.Type)
    func execute<T>(request: InternalRequest,
                    presentationBlock: ((UIViewController, (() -> Void)?) -> Void)?,
                    dismissBlock: ((UIViewController, (() -> Void)?) -> Void)?,
                    completionHandler: @escaping (Result<T>) -> Void) where T: Codable
    func execute<T>(request: InternalRequest, completionHandler: @escaping (Result<T>) -> Void) where T: Codable
    func execute<T>(request: RemoteRequest, completionHandler: @escaping (Result<T>) -> Void) where T: Codable
}
