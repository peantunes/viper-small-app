//
//  AppConfigurationProtocol.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import Foundation

protocol AppConfigurationProtocol {
    var backendApi:BackendIntegratorProtocol {get}
}
