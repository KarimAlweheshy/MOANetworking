//
//  ModuleConsumer.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit

public protocol ModuleConsumer {
    init(presentationBlock: ((UIViewController, (() -> Void)?) -> Void)?,
         dismissBlock: ((UIViewController, (() -> Void)?) -> Void)?)
    func execute<T: Codable>(networking: NetworkingType, request: InternalRequest, completionHandler: @escaping (Result<T>) -> Void)
}
