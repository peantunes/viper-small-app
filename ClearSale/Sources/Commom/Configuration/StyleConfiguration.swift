//
//  StyleConfiguration.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import UIKit

class StyleConfiguration {
    init() {
        defineNavigationBar()
    }
    func defineNavigationBar() {
        let navBar = UINavigationBar.appearance()
        navBar.backgroundColor = .black
        navBar.tintColor = .white
    }
}
