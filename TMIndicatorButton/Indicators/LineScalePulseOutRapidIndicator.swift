//
//  LineScalePulseOutRapidIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class LineScalePulseOutRapidIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let lineSize = size.width / 9
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: CFTimeInterval = 0.9
        let beginTimes = [0.5, 0.25, 0, 0.25, 0.5]
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.scale.y")
        animation.keyTimes = [0, 0.8, 0.9]
        animation.values = [1, 0.3, 1]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw lines
        for i in 0 ..< 5 {
            let line = NVActivityIndicatorShape.line.layerWith(size: CGSize(width: lineSize, height: size.height), color: color)
            let frame = CGRect(x: x + lineSize * 2 * CGFloat(i),
                              y: y,
                              width: lineSize,
                              height: size.height)
            
            animation.beginTime = beginTimes[i]
            line.frame = frame
            line.add(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
} 
