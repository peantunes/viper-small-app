//
//  BackendIntegratorApi.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import Foundation
import Alamofire
import Promises

struct ClearSaleURLs {
    static let creditReport = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
}
protocol GenericError {
    var description:String {get set}
}

struct CreditReportError:Error, GenericError {
    let title:String
    var description:String
}
struct JSONConversionError:Error, GenericError {
    let title:String
    var description:String
}

class BackendIntegratorApi:BackendIntegratorProtocol {
    
    func customerCreditReport(customerId: String) -> Promise<CreditSumaryInfoModel> {
        self.loadGenericRequest(url: ClearSaleURLs.creditReport, error: CreditReportError(title: "CreditReport", description: "Generic Error"))
    }
    
    private func loadGenericRequest<ResponseType:Decodable, ResponseError:Error & GenericError>(url:String, method:HTTPMethod = .get, error:ResponseError) -> Promise<ResponseType> {
        let promise = Promise<ResponseType>.pending()
        AF.request(url, method: method)
            .responseData { response in
                if let jsonValue = response.value {
                    do {
                    let content = try JSONDecoder().decode(ResponseType.self, from: jsonValue)
                        promise.fulfill(content)
                    } catch let error {
                        promise.reject(JSONConversionError(title: "Problems to convert", description: error.localizedDescription))
                    }
                } else {
                    var localError = error
                    localError.description = response.error?.errorDescription ?? error.description
                    
                    promise.reject(localError)
                }
        }
        return promise
    }
    
    
    
}


