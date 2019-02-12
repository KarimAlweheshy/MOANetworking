//
//  FacadeTests.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import XCTest
import Networking

struct WrongDumRequest: InternalRequest {
    static var regexPath: String = "/pay"
    static var responseType: Codable.Type = DumResponse.self
}

final class FacadeTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFacadeContainingRequest() {
        XCTAssertTrue(DumFacade.contains(request: DumRequest()))
    }
    
    func testFacadeNotContainingRequest() {
        XCTAssertTrue(!DumFacade.contains(request: WrongDumRequest()), "Comparaison is types based not value based!")
    }
}
