//
//  RemoteRequest.swift
//  Networking
//
//  Created by Karim Alweheshy on 2/7/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import Foundation

public protocol RemoteRequest {
    static var regexPath: String { get }
    
    static var method: HTTPMethod { get }
    
    /** Implement those if you want to have special scheme. Default is https*/
    static func scheme() -> String?
    
    /** Implement those if you want to target a different remote host. Default remote should
     be defined in the application's bundle info.plist under DEFAULT_REMOTE_HOST */
    static func host() -> String?
    
    static var responseType: Codable.Type { get }
    
    var bodyData: Data? { get }
    
    /** Implement this if your regexPath is different than your path */
    func path() -> String
    
    func urlRequest(from host: String) -> URLRequest
}

extension RemoteRequest {
    public static func scheme() -> String? { return nil }
    public static func host() -> String? { return nil }
    
    public func path() -> String { return Self.regexPath }
    
    public func urlRequest(from host: String) -> URLRequest {
        var components = URLComponents()
        components.scheme = Self.scheme() ?? "https"
        components.host = Self.host() ?? host
        components.path = path()
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpBody = bodyData
        urlRequest.httpMethod = Self.method.rawValue
        return urlRequest
    }
}
