//
//  ViewController.swift
//  TMIndicatorButton
//
//  Created by dragonbattesun on 06/06/2025.
//  Copyright (c) 2025 dragonbattesun. All rights reserved.
//

import UIKit
import TMIndicatorButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btnLine = TMIndicatorButton(type: .custom)
        let Indicator = BallRotateChaseIndicator(color: .white)
        btnLine.indicator = Indicator
        btnLine.setTitle("Line", for: .normal)
        btnLine.frame = CGRectMake(100, 200, 200, 48)
        btnLine.addTarget(self, action: #selector(clicktest(_:)), for: .touchUpInside)
        view.addSubview(btnLine)

    }

    @objc func clicktest(_ sender: TMIndicatorButton) {
        sender.showLoader(userInteraction: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

