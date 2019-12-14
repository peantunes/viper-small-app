//
//  CreditScoreModel.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import Foundation

struct CreditReportInfoModel:Decodable {
    let score:Int
    let maxScoreValue:Int
    let minScoreValue:Int
}
struct CreditSumaryInfoModel:Decodable {
    let creditReportInfo:CreditReportInfoModel
}
