//
//  AppConfiguration.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import Foundation

class AppConfiguration:AppConfigurationProtocol{
    let backendApi: BackendIntegratorProtocol
    let style:StyleConfiguration
    
    init(backendApi:BackendIntegratorProtocol) {
        self.backendApi = backendApi
        self.style = StyleConfiguration()
    }
}
