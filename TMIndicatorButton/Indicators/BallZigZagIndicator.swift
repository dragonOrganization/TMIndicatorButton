//
//  BallZigZagIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class BallZigZagIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let circleSize: CGFloat = size.width / 5
        let duration: CFTimeInterval = 0.7
        let deltaX = size.width - circleSize
        let deltaY = size.height - circleSize
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circles
        for i in 0 ..< 2 {
            let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x, y: y, width: circleSize, height: circleSize)
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x + circleSize / 2, y: y + circleSize / 2))
            
            if i == 0 {
                path.addLine(to: CGPoint(x: x + deltaX, y: y + deltaY))
            } else {
                path.addLine(to: CGPoint(x: x, y: y + deltaY))
            }
            
            path.addLine(to: CGPoint(x: x + circleSize / 2, y: y + circleSize / 2))
            
            animation.path = path.cgPath
            circle.frame = frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
} 
