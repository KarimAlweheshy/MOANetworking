//
//  Module.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import UIKit

/// A ModuleType is a way to declare an interface to a worker.
///
/// - We can define three types of modules:
///     - Action Module: May or may not provide an interface for the user to perform actions
///     that affect its response
///     - Resource Module: Used to fetch some resources and does not provide an interface.
///     i.e. A persistance store
///     - Task Module: Performs a long action on the background i.e. MailSync
public protocol ModuleType {
    
    /// A declaration of the internal requests a module can handle.
    ///
    /// You should not declare those internal requests inside your module,
    /// otherwise they will not be discoverable by other modules
    static var capabilities: [InternalRequest.Type] { get }
    
    /// Initializes a new module consumer. Parameters are needed for action modules.
    ///
    /// A consumer is initialized by the Networking Type execution of an internal request
    /// registered modules after making sure the module facade can handle the request.
    ///
    /// - Parameters:
    ///     - presentationBlock: Called the first time the module wants to present itself.
    ///     - dismissBlock: Called by the module whenever it wants to dismiss itself.
    ///     - presentedViewController: The module initial view controller
    init(presentationBlock: (_ presentedViewController: UIViewController) -> Void,
         dismissBlock: (_ presentedViewController: UIViewController) -> Void)
    
    
    /// Executes an internal request
    ///
    /// Called on the consumer after being initialized by the Netwroking type to handle the
    /// internal request which it now knows for sure it can handle. Also T.Type is
    /// is compared before hand to the response type declared in the InternalRequest
    /// to make sure the expectations are correct.
    ///
    /// - Parameters:
    ///     - networking: should be used internally by the module to make other internal or remote
    ///     calls. Should be useful to inject expected internal/remote networking expectations.
    ///     - request: instance of the internal request that caused the module to be initialized.
    ///     it should include all the infos needed to create the module.
    ///     - completionHandler: should be called after the module finished processing internal
    ///     request.
    ///     - result: Should indicate the result of the internal request processing by the module.
    func execute<T: Codable>(networking: NetworkingType,
                             request: InternalRequest,
                             completionHandler: @escaping (_ result: Result<T>) -> Void)
}
