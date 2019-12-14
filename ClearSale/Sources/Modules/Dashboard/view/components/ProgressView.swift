//
//  ProgressLayer.swift
//  ClearSale
//
//  Created by Pedro Antunes on 14/12/2019.
//  Copyright © 2019 Pedro Antunes. All rights reserved.
//

import UIKit

class ProgressView:UIView {
    private let progressLayer = CAShapeLayer()
    var lineWidth:CGFloat = 4
    var strokeColor = UIColor.orange
    
    var percentage:CGFloat = 0.0 {
        didSet {
            progressLayer.strokeEnd = percentage
        }
    }
        
    func setup(){
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.layer.addSublayer(progressLayer)
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeColor = strokeColor.cgColor
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = 0.0
        progressLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = self.frame.size
        progressLayer.path = UIBezierPath(arcCenter: .zero, radius: size.width/2 - 10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        progressLayer.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        self.layer.cornerRadius = trunc(size.width/2)
    }
    
}
