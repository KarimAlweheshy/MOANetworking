//
//  RemoteRequestTests.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import XCTest
import Networking

final class RemoteRequestTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRemoteRequestExplicitTranslation() {
        struct DumRemoteRequest: RemoteRequest {
            static var method: HTTPMethod = .get
            
            static var regexPath = "/users/{id}"
            static var responseType = DumResponse.self as Codable.Type
            
            static func scheme() -> String? { return "ftp" }
            static func host() -> String? { return "google" }
            
            func path() -> String { return "/users/1" }
            var bodyData: Data?
        }
        
        let remoteRequest = DumRemoteRequest()
        let urlRequest = remoteRequest.urlRequest(from: "amazon")
        
        assert(urlRequest.httpMethod == DumRemoteRequest.method.rawValue)
        
        let components = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)
        assert(components?.host == DumRemoteRequest.host())
        assert(components?.path == remoteRequest.path() )
        assert(components?.scheme == DumRemoteRequest.scheme() )
        
    }
    
    func testRemoteRequestImplicitTranslation() {
        struct DumRemoteRequest: RemoteRequest {
            static var method: HTTPMethod = .get
            
            static var regexPath = "/users/{id}"
            static var responseType = DumResponse.self as Codable.Type
            
            var bodyData: Data?
        }
        
        let remoteRequest = DumRemoteRequest()
        let urlRequest = remoteRequest.urlRequest(from: "amazon")
        
        assert(urlRequest.httpMethod == DumRemoteRequest.method.rawValue)
        
        let components = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)
        assert(components?.host == "amazon")
        assert(components?.path == DumRemoteRequest.regexPath )
        assert(components?.scheme == "https" )
        
    }
}
