//
//  DashboardIntegrator.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import Foundation

class DashboardIntegrator: DashboardIntegratorInputProtocol {
    let config:AppConfigurationProtocol
    weak var output:DashboardIntegratorOutputProtocol?
    
    init(config:AppConfigurationProtocol) {
        self.config = config
    }
    
    func loadUserScore() {
        config.backendApi.customerCreditReport(customerId: "any")
            .then{[weak self] credit in
                let creditReport = credit.creditReportInfo
                let viewModel = DashboardViewModel(userScore: creditReport.score,
                                   minScore: creditReport.minScoreValue,
                                   maxScore: creditReport.maxScoreValue)
                self?.output?.updateData(viewModel: viewModel)
        }
    }
}
