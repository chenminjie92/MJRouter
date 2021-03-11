//
//  LoginModuleServiceIMP.swift
//  LoginModule
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation
import Services

public class UserModuleServiceIMP: NSObject, UserModuleService,RouterProtocol {
    
    /// 在这里注册
    public static func registerRoutableDestination() {
        Router.register(RoutableService<UserModuleService>(), forMakingService: UserModuleServiceIMP.self)
    }
    
    /// 在这里返回控制器
    public static func destination(with configuration: RouterConfig?) -> AnyObject? {
        return nil
    }
    
    public func getUserInfo(for userId: String, result: ((_ userInfo: [String: Any]) -> Void)) {
        guard !userId.isEmpty else {
            return
        }
        result(["nikeName": "chenminjie", "age": 18])
    }
   
}

extension MineViewController: RouterProtocol {
    
    static func registerRoutableDestination() {
        RouterHelper.registerController(url: RouterHelper.RegisteredUrl.user.rawValue, page: MineViewController.self)
    }
    
    static func destination(with configuration: RouterConfig?) -> AnyObject? {
        let vc = MineViewController()
        return vc
    }
}
