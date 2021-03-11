//
//  LoginViewController.swift
//  LoginModule-LoginModule
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation
import SnapKit
import Services

class MineViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    /// 按钮
    fileprivate lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("去商品详情", for: .normal)
        view.backgroundColor = UIColor.red
        view.setTitleColor(UIColor.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        return  view
    }()
    
    fileprivate lazy var goodsButton: UIButton = {
        let view = UIButton()
        view.setTitle("去商品详情", for: .normal)
        view.backgroundColor = UIColor.green
        view.setTitleColor(UIColor.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.addTarget(self, action: #selector(goodsButtonClick), for: .touchUpInside)
        return  view
    }()
}

extension MineViewController {
    
    private func setUpViews() {
        navigationItem.title = "用户首页"
        view.backgroundColor = UIColor.white
        view.addSubview(button)
        view.addSubview(goodsButton)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 200, height: 50))
        }
        goodsButton.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}

extension MineViewController {
    
    @objc func goodsButtonClick() {
        RouterHelper.open(router: "mj://goods/detail?goodsId=123", from: self)
    }
    @objc func buttonClick() {
        RouterHelper.open(router: "mj://goods/detail", params: ["goodsId": "123"], from: self)
    }
}
