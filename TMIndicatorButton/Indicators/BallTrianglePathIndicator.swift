//
//  BallTrianglePathIndicator.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//


import UIKit

open class BallTrianglePathIndicator: TMIndicator {
    
    open override func setupAnimation(in layer: CALayer, size: CGSize) {
        let circleSize = size.width / 5
        let deltaX = size.width / 2 - circleSize / 2
        let deltaY = size.height / 2 - circleSize / 2
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: CFTimeInterval = 2
        let timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        // Top-center circle
        let topCenterCircle = createCircle(at: CGPoint(x: x + size.width / 2, y: y), size: circleSize, color: color)
        let topCenterPath = UIBezierPath()
        topCenterPath.move(to: CGPoint(x: x + size.width / 2, y: y))
        topCenterPath.addLine(to: CGPoint(x: x + size.width - circleSize / 2, y: y + size.height - circleSize / 2))
        topCenterPath.addLine(to: CGPoint(x: x + circleSize / 2, y: y + size.height - circleSize / 2))
        topCenterPath.close()
        animation.path = topCenterPath.cgPath
        animation.duration = duration
        animation.beginTime = 0
        animation.timingFunction = timingFunction
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        topCenterCircle.add(animation, forKey: "animation")
        layer.addSublayer(topCenterCircle)
        
        // Bottom-right circle
        let bottomRightCircle = createCircle(at: CGPoint(x: x + size.width - circleSize / 2, y: y + size.height - circleSize / 2), size: circleSize, color: color)
        let bottomRightPath = UIBezierPath()
        bottomRightPath.move(to: CGPoint(x: x + size.width - circleSize / 2, y: y + size.height - circleSize / 2))
        bottomRightPath.addLine(to: CGPoint(x: x + circleSize / 2, y: y + size.height - circleSize / 2))
        bottomRightPath.addLine(to: CGPoint(x: x + size.width / 2, y: y))
        bottomRightPath.close()
        animation.path = bottomRightPath.cgPath
        animation.duration = duration
        animation.beginTime = duration / 3
        bottomRightCircle.add(animation, forKey: "animation")
        layer.addSublayer(bottomRightCircle)
        
        // Bottom-left circle
        let bottomLeftCircle = createCircle(at: CGPoint(x: x + circleSize / 2, y: y + size.height - circleSize / 2), size: circleSize, color: color)
        let bottomLeftPath = UIBezierPath()
        bottomLeftPath.move(to: CGPoint(x: x + circleSize / 2, y: y + size.height - circleSize / 2))
        bottomLeftPath.addLine(to: CGPoint(x: x + size.width / 2, y: y))
        bottomLeftPath.addLine(to: CGPoint(x: x + size.width - circleSize / 2, y: y + size.height - circleSize / 2))
        bottomLeftPath.close()
        animation.path = bottomLeftPath.cgPath
        animation.duration = duration
        animation.beginTime = duration * 2 / 3
        bottomLeftCircle.add(animation, forKey: "animation")
        layer.addSublayer(bottomLeftCircle)
    }
    
    private func createCircle(at position: CGPoint, size: CGFloat, color: UIColor) -> CALayer {
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: size, height: size), color: color)
        circle.frame = CGRect(x: position.x, y: position.y, width: size, height: size)
        return circle
    }
} 
