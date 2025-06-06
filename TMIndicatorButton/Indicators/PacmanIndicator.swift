//
//  PacmanIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class PacmanIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let layerSize = CGSize(width: size.width, height: size.height)
        let pacmanSize = 2 * layerSize.width / 3
        let dotSize = layerSize.width / 6
        let x = (layer.bounds.size.width - layerSize.width) / 2
        let y = (layer.bounds.size.height - layerSize.height) / 2
        
        // Stroke animation for pacman
        let pacmanAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        pacmanAnimation.keyTimes = [0, 0.5, 1]
        pacmanAnimation.values = [0, CGFloat.pi / 4, 0]
        pacmanAnimation.duration = 0.5
        pacmanAnimation.repeatCount = HUGE
        pacmanAnimation.isRemovedOnCompletion = false
        
        // Draw pacman
        let pacman = NVActivityIndicatorShape.pacman.layerWith(size: CGSize(width: pacmanSize, height: pacmanSize), color: color)
        let pacmanFrame = CGRect(x: x, y: y + layerSize.height / 2 - pacmanSize / 2, width: pacmanSize, height: pacmanSize)
        pacman.frame = pacmanFrame
        pacman.add(pacmanAnimation, forKey: "animation")
        layer.addSublayer(pacman)
        
        // Dot animation
        let dotAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        dotAnimation.duration = 2
        dotAnimation.fromValue = layerSize.width - dotSize
        dotAnimation.toValue = 0
        dotAnimation.repeatCount = HUGE
        dotAnimation.isRemovedOnCompletion = false
        
        // Dot opacity animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.duration = 2
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.7
        opacityAnimation.repeatCount = HUGE
        opacityAnimation.isRemovedOnCompletion = false
        
        // Dot animation group
        let animation = CAAnimationGroup()
        animation.animations = [dotAnimation, opacityAnimation]
        animation.duration = 2
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw dots
        for i in 0 ..< 4 {
            let dot = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: dotSize, height: dotSize), color: color)
            let dotFrame = CGRect(x: x + layerSize.width - dotSize, y: y + layerSize.height / 2 - dotSize / 2, width: dotSize, height: dotSize)
            dot.frame = dotFrame
            animation.beginTime = CACurrentMediaTime() + Double(i) * 0.5
            dot.add(animation, forKey: "animation")
            layer.addSublayer(dot)
        }
    }
} 
