//
//  EmailResponse.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct EmailResponse: Codable {
    public let id: UUID
    
    public init(id: UUID = UUID()) {
        self.id = id
    }
}
