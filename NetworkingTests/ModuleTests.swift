//
//  ModuleTests.swift
//  NetworkingTests
//
//  Created by Karim Alweheshy on 2/11/19.
//  Copyright © 2019 Karim Alweheshy. All rights reserved.
//

import XCTest
import Networking

final class ModuleTests: XCTestCase {
    let module = DumModule.self
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRegisteredRequestCorrectResponse() {
        let expectation = XCTestExpectation(description: #function)
        let request = DumRequest()
        module.execute(networking: DumNetworking(), presentationBlock: nil, dismissBlock: nil, request: request) { (result: Result<DumResponse>) in
            switch result {
            case .success: expectation.fulfill()
            case .error: XCTFail("Should not receive an error for registered request!")
            }
        }
        wait(for: [expectation], timeout: TimeInterval.greatestFiniteMagnitude)
    }
    
    func testRegisteredRequestWrongResponse() {
        let expectation = XCTestExpectation(description: #function)
        let request = DumRequest()
        module.execute(networking: DumNetworking(), presentationBlock: nil, dismissBlock: nil, request: request) { (result: Result<AuthenticationResponse>) in
            switch result {
            case .success: XCTFail("Should receive an error a wrong expected return type!")
            case .error(let error):
                if let error = error as? ResponseError, error.errorCode == 400 {
                    expectation.fulfill()
                } else {
                    XCTFail("Should receive a 400 bad request error!\nReceived \(error.localizedDescription) instead!")
                }
            }
        }
        wait(for: [expectation], timeout: TimeInterval.greatestFiniteMagnitude)
    }
    
    func testUnregisteredRequest() {
        let expectation = XCTestExpectation(description: #function)
        let request = ExplicitLoginRequest(data: ExplicitLoginRequestBody(email: nil, password: nil))
        module.execute(networking: DumNetworking(), presentationBlock: nil, dismissBlock: nil, request: request) { (result: Result<DumResponse>) in
            switch result {
            case .success: XCTFail("Should receive an error a wrong expected return type!")
            case .error(let error):
                if let error = error as? ResponseError, error.errorCode == 400 {
                    expectation.fulfill()
                } else {
                    XCTFail("Should receive a 400 bad request error!\nReceived \(error.localizedDescription) instead!")
                }
            }
        }
        wait(for: [expectation], timeout: TimeInterval.greatestFiniteMagnitude)
    }
    
}
