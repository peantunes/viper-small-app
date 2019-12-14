//
//  DashboardWireframe.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import UIKit

class DashboardWireframe {
    let config:AppConfigurationProtocol

    weak var viewController:UIViewController?
    
    init(config:AppConfigurationProtocol) {
        self.config = config
    }
}

extension DashboardWireframe:DashboardWireframeProtocol {
    static var storyboard: String {
        "Dashboard"
    }
    
    func showDashboard() -> UIViewController? {
       let navController = DashboardWireframe.mainStoryboard.instantiateInitialViewController() as? UINavigationController
        let viewController = navController?.children.first as? DashboardViewController
        
        let integrator = DashboardIntegrator(config: config)
        let presenter = DashboardPresenter(integrator: integrator)
        integrator.output = presenter
        presenter.view = viewController
        viewController?.presenter = presenter
        self.viewController = viewController
        
        return navController
        
    }
    
}
