//
//  ViewController.swift
//  MJRouter
//
//  Created by chenminjie92@126.com on 03/11/2021.
//  Copyright (c) 2021 chenminjie92@126.com. All rights reserved.
//

import UIKit
import Services

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页"
        let button: UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(button)
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonClick() {
        RouterHelper.open(router: .user, from: self)
    }

}

