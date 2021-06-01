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
        
        let button1: UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 250, width: 100, height: 100))
        button1.backgroundColor = UIColor.red
        button1.addTarget(self, action: #selector(buttonClick1), for: .touchUpInside)
        view.addSubview(button1)
        view.backgroundColor = UIColor.white
        
        let button3: UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 400, width: 100, height: 100))
        button3.backgroundColor = UIColor.red
        button3.addTarget(self, action: #selector(buttonClick3), for: .touchUpInside)
        view.addSubview(button3)
        view.backgroundColor = UIColor.white
        
        let button4: UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 550, width: 100, height: 100))
        button4.backgroundColor = UIColor.red
        button4.addTarget(self, action: #selector(buttonClick4), for: .touchUpInside)
        view.addSubview(button4)
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonClick() {
        RouterHelper.open(router: .user, from: self)
    }
    
    @objc func buttonClick1() {
        self.navigationController?.pushViewController(OCViewController(), animated: true)
    }

    @objc func buttonClick3() {
        RouterHelper.open(router: .shopCart, from: self)
    }
    @objc func buttonClick4() {
        let service = Router.makeDestination(to: RoutableService<ShopCartModuleService>())
        print(service?.getShopCartList())
    }
}

