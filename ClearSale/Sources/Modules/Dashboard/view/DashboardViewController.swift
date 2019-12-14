//
//  DashboardViewController.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var creditScoreLineLabel:UILabel?
    @IBOutlet weak var totalScoreLabel:UILabel?
    @IBOutlet weak var outOfLabel:UILabel?
    
    @IBOutlet weak var viewContainer:ProgressView?
    
    var presenter:DashboardPresenter?
    var viewModel:DashboardViewModel? {
        didSet {
            guard let newValue = viewModel else {return}
            self.totalScoreLabel?.text = "\(newValue.userScore)"
            self.outOfLabel?.text = "out of \(newValue.maxScore)"
            self.refreshPercentage()
        }
    }
    
    private var progressLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainer?.setup()
        self.title = "Dashboard"
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func refreshPercentage() {
        guard let viewModel = self.viewModel else {return}
        viewContainer?.percentage = CGFloat(viewModel.userScore)/CGFloat(viewModel.maxScore)
    }

}

extension DashboardViewController:DashboardViewProtocol {
    func showLoading() {
        
    }
    
    func showCreditScore(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }
    
    
}
