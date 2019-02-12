//
//  EmailCreationRequest.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public struct EmailCreationRequestBody: Codable {
    public let draftID: UUID?
    public let receiversIDs: [UUID]?
    public let ccIDs: [UUID]?
    public let bccIDs: [UUID]?
    public let subject: String?
    public let body: String?
    public let attachementsURLs: [URL]?
    
    public init(draftID: UUID?, receiversIDs: [UUID]?, ccIDs: [UUID]?,
                bccIDs: [UUID]?, subject: String?, body: String?, attachementsURLs: [URL]?) {
        self.draftID = draftID
        self.receiversIDs = receiversIDs
        self.ccIDs = ccIDs
        self.bccIDs = bccIDs
        self.subject = subject
        self.body = body
        self.attachementsURLs = attachementsURLs
    }
}

public struct EmailCreationRequest: InternalRequest {
    public static var regexPath = "emails/create"
    public static var responseType: Codable.Type = EmailResponse.self
    
    public let data: EmailCreationRequestBody
    
    public init(data: EmailCreationRequestBody) {
        self.data = data
    }
}
