//
//  DumConsumer.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit
import Networking

struct DumConsumer: ModuleConsumer {
    init(presentationBlock: ((UIViewController, (() -> Void)?) -> Void)?, dismissBlock: ((UIViewController, (() -> Void)?) -> Void)?) {
        
    }
    
    func execute<T: Codable>(networking: NetworkingType, request: InternalRequest, completionHandler: @escaping (Result<T>) -> Void) {
        if let response = DumResponse() as? T {
            completionHandler(.success(response))
        } else {
            completionHandler(.error(ResponseError.other))
        }
    }
}
