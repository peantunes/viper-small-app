//
//  BaseWireframeProtocol.swift
//  ClearSale
//
//  Created by Pedro Antunes on 13/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import UIKit

protocol BaseWireframeProtocol:class {
    static var storyboard:String{get}
}

extension BaseWireframeProtocol {
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: Self.storyboard, bundle: Bundle.main)
    }
}
