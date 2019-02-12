//
//  ResponseError.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public enum ResponseError: Error {
    
    case serializationFailed
    case taskCancelled
    case badRequest400(error: Error?)
    case unauthorized401(error: Error?)
    case forbidden403(error: Error?)
    case notFound404(error: Error?)
    case other400(error: Error?)
    case serverError500(error: Error?)
    case other
    
    public var errorCode: Int? {
        
        get {
            
            switch self {
            case .badRequest400:
                return 400
            case .unauthorized401:
                return 401
            case .forbidden403:
                return 403
            case .notFound404:
                return 404
            case .other400:
                return 405
            case .serverError500:
                return 500
            default:
                return nil
            }
        }
    }
    
    public init?(error: Error?, response: HTTPURLResponse?, code: Int? = nil) {
        
        let responseCode: Int
        if let response = response {
            responseCode = response.statusCode
        } else if let code = code {
            responseCode = code
        } else {
            responseCode = 0
            self = .other
        }
        
        switch responseCode {
        case 200..<300:
            return nil
        case 400:
            self = .badRequest400(error: error)
        case 401:
            self = .unauthorized401(error: error)
        case 403:
            self = .forbidden403(error: error)
        case 404:
            self = .notFound404(error: error)
        case 405..<500:
            self = .other400(error: error)
        case 500..<600:
            self = .serverError500(error: error)
        default:
            self = .other
        }
    }
}
