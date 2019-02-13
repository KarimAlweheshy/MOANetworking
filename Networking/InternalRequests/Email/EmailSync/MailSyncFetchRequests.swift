//
//  MailSyncDeleteRequests.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/13/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation
import CoreData

public struct MailSyncFetchRequest: InternalRequest {
    public static var responseType: Any.Type = Array<EmailResponse>.self
}

