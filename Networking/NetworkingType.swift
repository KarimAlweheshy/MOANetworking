//
//  Networking.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit

/// NetworkingType provides a protocol to handle intra-modules as well as client-server communications
public protocol NetworkingType: AnyObject {
    
    /// Regisetred modules
    var registeredModules: [ModuleType.Type] { get }
    
    // Currently running modules
    var inMemoryModule: [ModuleType] { get set }
    
    /// Called by a module to communicate to another regsitered module.
    ///
    /// - The default implementation:
    ///     - Modules that can handle the request are those who:
    ///         - Declared the same InternalRequest.self in their capabilities
    ///         - Have the same T.Type declared as a responseType in these matching capabilities
    ///     - These modules are then initialized and called upon to handle the request
    ///
    /// - Parameters:
    ///     - request: The internal request
    ///     - presentationBlock: passed down to action modules to be able to present themselves
    ///     - dismissBlock: passed down to action modules to be able to dismiss themselves
    ///     - presentedViewController: The initial view controller of the module
    ///     - completionHandler: called by the module to pass the result to the calling module
    ///     - result: Used to describe the final result of the module.
    func execute<T>(request: InternalRequest,
                    presentationBlock: @escaping (_ presentedViewController: UIViewController) -> Void,
                    dismissBlock: @escaping (_ presentedViewController: UIViewController) -> Void,
                    completionHandler: @escaping (_ result: Result<T>) -> Void)
    
    /// Called by a module to communicate to the server.
    /// - Parameters:
    ///     - request: The remote request
    ///     - completionHandler: called by the module to pass the result to the calling module
    ///     - result: Used to describe the final result of the server.
    func execute<T: Codable>(request: RemoteRequest,
                             completionHandler: @escaping (_ result: Result<T>) -> Void)
}

extension NetworkingType {
    /// Default implementation
    ///
    /// Modules that can handle the request are those who:
    ///     1 - Declared the same InternalRequest type in their capabilities
    ///     2 - Have the same T.Type declared as a responseType in these matching capabilities
    ///
    /// These modules are then initialized and called upon to handle the request
    public func execute<T>(request: InternalRequest,
                           presentationBlock: @escaping (UIViewController) -> Void,
                           dismissBlock: @escaping (UIViewController) -> Void,
                           completionHandler: @escaping (Result<T>) -> Void) {
        
        let canHandleModules = registeredModules.filter {
            let hasCapability = $0.capabilities.contains { $0 == type(of: request) }
            let hasCorrectResponseType = T.self == type(of: request).responseType
            return hasCapability && hasCorrectResponseType
        }
        
        guard !canHandleModules.isEmpty else {
            completionHandler(.error(ResponseError.badRequest400(error: nil)))
            return
        }
        
        canHandleModules.forEach { Module in
            let module = Module.init(presentationBlock: presentationBlock,
                                     dismissBlock: dismissBlock)
            module.execute(networking: self, request: request) { (result: Result<T>) in
                self.inMemoryModule.removeAll { $0 === module }
                completionHandler(result)
            }
            inMemoryModule.append(module)
        }
    }
}
