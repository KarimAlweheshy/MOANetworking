//
//  Result.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case error(Error)
}
