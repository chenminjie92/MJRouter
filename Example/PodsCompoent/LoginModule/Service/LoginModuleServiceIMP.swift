//
//  LoginModuleServiceIMP.swift
//  LoginModule
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation
import Services

public class LoginModuleServiceIMP:NSObject, LoginModuleService,RouterProtocol {
    
    /// 在这里注册
    public static func registerRoutableDestination() {
        Router.register(RoutableService<LoginModuleService>(), forMakingService: LoginModuleServiceIMP.self)
    }
    
    /// 在这里返回控制器
    public static func destination(with configuration: RouterConfig?) -> AnyObject? {
        return nil
    }
    
    public var isLogin: Bool {
        return LoginViewController.isLogin
    }
    
    public var token: String? {
        return "123411"
    }
    
    public var userId: String? {
        return "1231232131"
    }
    
    public func logout() {
        LoginViewController.isLogin = false
    }
    
    @discardableResult
    public func doActionIfLogined(formVc: UIViewController, execute:((_ isAlreadyLogin: Bool) -> Void)?) -> Bool {
        
        if isLogin {
            execute?(true)
        } else {
            let loginvc = LoginViewController()
            loginvc.dismissBack = {
                execute?(LoginViewController.isLogin)
            }
            let nav = UINavigationController.init(rootViewController: loginvc)
            nav.modalPresentationStyle = .fullScreen
            formVc.present(nav, animated: true, completion: nil)
        }
        return isLogin
    }
}
