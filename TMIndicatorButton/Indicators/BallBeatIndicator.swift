//
//  BallBeatIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//

import UIKit

open class BallBeatIndicator: TMIndicator {

    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let circleSpacing: CGFloat = 2
        let circleSize = (size.width - circleSpacing * 2) / 3
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - circleSize) / 2
        let duration: CFTimeInterval = 0.7
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0.35, 0, 0.35]
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [1, 0.75, 1]
        scaleAnimation.duration = duration
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.keyTimes = [0, 0.5, 1]
        opacityAnimation.values = [1, 0.2, 1]
        opacityAnimation.duration = duration
        
        // Aniamtion
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circles
        for i in 0 ..< 3 {
            let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                               y: y,
                               width: circleSize,
                               height: circleSize)
            
            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
}
