//
//  BallPulseRiseIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class BallPulseRiseIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let circleSpacing: CGFloat = 2
        let circleSize = (size.width - 4 * circleSpacing) / 5
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - circleSize) / 2
        let deltaY = size.height / 2
        let duration: CFTimeInterval = 1
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.15, 0.46, 0.9, 0.6)
        let oddAnimation = self.oddAnimation(duration: duration, deltaY: deltaY, timingFunction: timingFunction)
        let evenAnimation = self.evenAnimation(duration: duration, deltaY: deltaY, timingFunction: timingFunction)
        
        // Draw circles
        for i in 0 ..< 5 {
            let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                               y: y,
                               width: circleSize,
                               height: circleSize)
            
            circle.frame = frame
            if i % 2 == 0 {
                circle.add(evenAnimation, forKey: "animation")
            } else {
                circle.add(oddAnimation, forKey: "animation")
            }
            layer.addSublayer(circle)
        }
    }
    
    private func oddAnimation(duration: CFTimeInterval, deltaY: CGFloat, timingFunction: CAMediaTimingFunction) -> CAAnimation {
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [0, deltaY, 0]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        return animation
    }
    
    private func evenAnimation(duration: CFTimeInterval, deltaY: CGFloat, timingFunction: CAMediaTimingFunction) -> CAAnimation {
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [deltaY, 0, deltaY]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        return animation
    }
} 
