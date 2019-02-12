//
//  DumModule.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation
import Networking

struct DumModule: Module {
    static var Facade: ModuleFacade.Type = DumFacade.self
    static var Consumer: ModuleConsumer.Type = DumConsumer.self
}

