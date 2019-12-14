//
//  DashboardIntegratorSpec.swift
//  ClearSaleTests
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import XCTest


@testable import ClearSale

class DashboardIntegratorSpec: XCTestCase {
    var parseFailConfig:AppConfigurationProtocol!
    var failConfig:AppConfigurationProtocol!
    var validConfig:AppConfigurationProtocol!
    override func setUp() {
        super.setUp()
        parseFailConfig = AppConfiguration(backendApi: BackendApiMockParseFail())
        failConfig = AppConfiguration(backendApi: BackendApiMockContentFail())
        validConfig = AppConfiguration(backendApi: BackendApiMockSuccess())
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFailParse() {
        let expectation = XCTestExpectation(description: "Calling the backend for Customer Credit Report")
        parseFailConfig.backendApi.customerCreditReport(customerId: "123")
            .then{item in
                XCTFail("Shouldn't work")
                expectation.fulfill()
        }.catch{error in
            XCTAssert(error is JSONConversionError, "Different error than expected")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testFailResponse() {
        let expectation = XCTestExpectation(description: "Calling the backend for Customer Credit Report")
        failConfig.backendApi.customerCreditReport(customerId: "123")
            .then{item in
                XCTFail("Shouldn't work")
                expectation.fulfill()
        }.catch{error in
            XCTAssert(error is CreditReportError, "Different error than expected")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testCreditScoreResponse() {
        let expectation = XCTestExpectation(description: "Calling the backend for Customer Credit Report")
        validConfig.backendApi.customerCreditReport(customerId: "123")
            .then{item in
                XCTAssert(item.creditReportInfo.score == 120, "Invalid value")
                expectation.fulfill()
        }.catch{error in
            XCTFail("Shouldn't fail")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    

}
