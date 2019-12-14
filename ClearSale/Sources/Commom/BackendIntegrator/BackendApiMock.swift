//
//  BackendApiMock.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import Foundation
import Promises


class BackendApiMockSuccess:BackendIntegratorProtocol {
    func customerCreditReport(customerId: String) -> Promise<CreditSumaryInfoModel> {
        let creditScore = CreditSumaryInfoModel(
            creditReportInfo: CreditReportInfoModel(
                score: 120,
                maxScoreValue: 200,
                minScoreValue: 0))
        return Promise<CreditSumaryInfoModel>(creditScore)
    }
}

///Fail classes
class BackendApiMockContentFail:BackendIntegratorProtocol {
    func customerCreditReport(customerId: String) -> Promise<CreditSumaryInfoModel> {
        Promise<CreditSumaryInfoModel>(CreditReportError(title:"fail", description: "sumary error"))
    }
}

class BackendApiMockParseFail:BackendIntegratorProtocol {
    func customerCreditReport(customerId: String) -> Promise<CreditSumaryInfoModel> {
        genericResult()
    }
    
    //I have create in this way, so if I have more backend methods I can reuse it
    func genericResult<ResultType:Decodable>() -> Promise<ResultType> {
        Promise<ResultType>(JSONConversionError(title:"fail", description: "sumary error"))
    }
}


