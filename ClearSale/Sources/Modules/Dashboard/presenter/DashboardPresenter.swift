//
//  DashboardPresenter.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import Foundation

class DashboardPresenter {
    let integrator:DashboardIntegratorInputProtocol
    weak var view:DashboardViewProtocol?
    
    init(integrator:DashboardIntegratorInputProtocol) {
        self.integrator = integrator
    }
}

extension DashboardPresenter:DashboardPresenterProtocol {

    func viewDidLoad() {
        integrator.loadUserScore()
    }
    
    func refreshScore() {
        self.integrator.loadUserScore()
    }
    
    
}

extension DashboardPresenter:DashboardIntegratorOutputProtocol {
    func updateData(viewModel: DashboardViewModel) {
        self.view?.showCreditScore(viewModel: viewModel)
    }
}
