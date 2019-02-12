//
//  Module.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit

public protocol Module {
    static var Facade: ModuleFacade.Type { get }
    static var Consumer: ModuleConsumer.Type { get }
}

extension Module {
    static public func execute<T: Codable>(networking: NetworkingType,
                                           presentationBlock: ((UIViewController, (() -> Void)?) -> Void)?,
                                           dismissBlock:  ((UIViewController, (() -> Void)?) -> Void)?,
                                           request: InternalRequest,
                                           completionHandler: @escaping (Result<T>) -> Void) {
        guard Facade.contains(request: request), T.self == type(of: request).responseType else {
            completionHandler(.error(ResponseError.badRequest400(error: nil)))
            return
        }
        
        let consumer = Consumer.init(presentationBlock: presentationBlock, dismissBlock: dismissBlock)
        consumer.execute(networking: networking, request: request, completionHandler: completionHandler)
    }
}
