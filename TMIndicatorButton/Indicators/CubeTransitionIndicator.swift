//
//  CubeTransitionIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class CubeTransitionIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let squareSize = size.width / 5
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let deltaX = size.width - squareSize
        let deltaY = size.height - squareSize
        let duration: CFTimeInterval = 1.6
        let timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        let beginTime = CACurrentMediaTime()
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        scaleAnimation.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction]
        scaleAnimation.values = [1, 0.5, 1, 0.5, 1]
        scaleAnimation.duration = duration
        
        // Translate animation
        let translateAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
        
        translateAnimation.keyTimes = scaleAnimation.keyTimes
        translateAnimation.timingFunctions = scaleAnimation.timingFunctions
        translateAnimation.values = [
            NSValue(cgSize: CGSize(width: 0, height: 0)),
            NSValue(cgSize: CGSize(width: deltaX, height: 0)),
            NSValue(cgSize: CGSize(width: deltaX, height: deltaY)),
            NSValue(cgSize: CGSize(width: 0, height: deltaY)),
            NSValue(cgSize: CGSize(width: 0, height: 0))
        ]
        translateAnimation.duration = duration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, translateAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw squares
        let leftSquare = NVActivityIndicatorShape.rectangle.layerWith(size: CGSize(width: squareSize, height: squareSize), color: color)
        let rightSquare = NVActivityIndicatorShape.rectangle.layerWith(size: CGSize(width: squareSize, height: squareSize), color: color)
        let frame = CGRect(x: x, y: y, width: squareSize, height: squareSize)
        
        leftSquare.frame = frame
        rightSquare.frame = frame
        rightSquare.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        
        animation.beginTime = beginTime
        leftSquare.add(animation, forKey: "animation")
        animation.beginTime = beginTime + duration / 2
        rightSquare.add(animation, forKey: "animation")
        
        layer.addSublayer(leftSquare)
        layer.addSublayer(rightSquare)
    }
} 
