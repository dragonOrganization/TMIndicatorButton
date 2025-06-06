//
//  OrbitIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class OrbitIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let duration: CFTimeInterval = 1.9
        let satelliteSize = size.width / 6
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        
        // Center circle
        let centerCircle = NVActivityIndicatorShape.ring.layerWith(size: CGSize(width: size.width, height: size.height), color: color)
        let centerCircleFrame = CGRect(x: x, y: y, width: size.width, height: size.height)
        centerCircle.frame = centerCircleFrame
        layer.addSublayer(centerCircle)
        
        // Satellite circle
        let satelliteCircle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: satelliteSize, height: satelliteSize), color: color)
        let satelliteCircleFrame = CGRect(x: x + size.width - satelliteSize, y: y + size.height / 2 - satelliteSize / 2, width: satelliteSize, height: satelliteSize)
        satelliteCircle.frame = satelliteCircleFrame
        
        // Orbit animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = duration
        animation.path = UIBezierPath(arcCenter: CGPoint(x: x + size.width / 2, y: y + size.height / 2),
                                     radius: size.width / 2,
                                     startAngle: 0,
                                     endAngle: 2 * CGFloat.pi,
                                     clockwise: true).cgPath
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        satelliteCircle.add(animation, forKey: "animation")
        layer.addSublayer(satelliteCircle)
    }
} 
