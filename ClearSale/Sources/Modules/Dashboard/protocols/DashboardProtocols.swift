//
//  DashboardProtocols.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import UIKit

struct DashboardViewModel {
    let userScore:Int
    let minScore:Int
    let maxScore:Int
}

protocol DashboardWireframeProtocol:BaseWireframeProtocol {
    func showDashboard() -> UIViewController?
}

protocol DashboardPresenterProtocol:class {
    func viewDidLoad()
    func refreshScore()
}

protocol DashboardViewProtocol:class {
    func showLoading()
    func showCreditScore(viewModel:DashboardViewModel)
}

protocol DashboardIntegratorInputProtocol {
    func loadUserScore()
}

protocol DashboardIntegratorOutputProtocol:class {
    func updateData(viewModel:DashboardViewModel)
}
