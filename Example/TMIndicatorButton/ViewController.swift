//
//  ViewController.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//

import UIKit
import TMIndicatorButton
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btnLine = TMIndicatorButton(type: .custom)
        btnLine.contentEdgeInsets = .zero
        let Indicator = BallRotateChaseIndicator(color: .white)
        btnLine.indicator = Indicator
        if let rawImage = UIImage(named: "grammar_favirate_selected") {
            let originalImage = rawImage.withRenderingMode(.alwaysTemplate)
            btnLine.setImage(originalImage, for: .normal)
            btnLine.imageView?.contentMode = .scaleAspectFit
        } else {
            print("⚠️ Image 'grammar_favirate_selected' not found in asset catalog")
        }
//        btnLine.frame = CGRectMake(100, 200, 200, 48)
        btnLine.rippleColor = UIColor.red.withAlphaComponent(0.8)
        btnLine.enableRippleBehavior = true
//        btnLine.addTarget(self, action: #selector(clicktest(_:)), for: .touchUpInside)
        view.addSubview(btnLine)

        
        btnLine.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(200)
            make.width.height.equalTo(24)
            make.bottom.equalToSuperview().offset(-100)
        }
    }

    @objc func clicktest(_ sender: TMIndicatorButton) {
        sender.showLoader(userInteraction: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

