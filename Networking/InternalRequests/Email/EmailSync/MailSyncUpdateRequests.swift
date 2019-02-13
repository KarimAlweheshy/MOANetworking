//
//  MailSyncDeleteRequests.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/13/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct MailSyncUpdateByIDRequest: InternalRequest {
    public static var responseType: Any.Type = Array<EmailResponse>.self
}

public struct MailSyncMarkAsReadRequest: InternalRequest {
    public static var responseType: Any.Type = Array<EmailResponse>.self
}
