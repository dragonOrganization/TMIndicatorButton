//
//  LineScalePartyIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class LineScalePartyIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let lineSize = size.width / 7
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let durations: [CFTimeInterval] = [1.26, 0.43, 1.01, 0.73]
        let beginTimes: [CFTimeInterval] = [0.77, 0.29, 0.28, 0.74]
        let timingFunction = CAMediaTimingFunction(name: .default)
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [1, 0.5, 1]
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw lines
        for i in 0 ..< 4 {
            let line = NVActivityIndicatorShape.line.layerWith(size: CGSize(width: lineSize, height: size.height), color: color)
            let frame = CGRect(x: x + lineSize * 2 * CGFloat(i),
                              y: y,
                              width: lineSize,
                              height: size.height)
            
            animation.duration = durations[i]
            animation.beginTime = beginTimes[i]
            line.frame = frame
            line.add(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
} 
