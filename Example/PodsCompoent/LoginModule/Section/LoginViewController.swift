//
//  LoginViewController.swift
//  LoginModule-LoginModule
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation
import SnapKit

class LoginViewController: UIViewController {
    
    static var isLogin: Bool = false
    
    var dismissBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    /// 登录按钮
    fileprivate lazy var loginButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor.red
        view.setTitle("登录", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        return  view
    }()
}

extension LoginViewController {
    
    private func setUpViews() {
        navigationItem.title = "登录"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "关闭", style: .plain, target: self, action: #selector(clooseClick))
        view.addSubview(loginButton)
        view.backgroundColor = UIColor.white
        loginButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(150)
        }
    }
}

extension LoginViewController {
    
    @objc func clooseClick() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func loginClick() {
        LoginViewController.isLogin = true
        dismiss(animated: true) {[weak self] in
            self?.dismissBack?()
        }
    }
}
