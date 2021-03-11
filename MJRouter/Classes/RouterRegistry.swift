//
//  RouterRegistry.swift
//  Extensions
//
//  Created by chenminjie on 2021/1/4.
//

import Foundation

class RouterRegistry: NSObject {
    
    /// 是否注册成功
    private static var _registrationFinished: Bool = false
    /// 是否注册成功
    public static var registrationFinished: Bool  {
        get {
            return _registrationFinished
        }
    }

    /// 注册所有控制器
    static func registerAll() {
        guard registrationFinished == false else {
            return
        }
        for _class in Router.getClassList(RouterProtocol.self) {
            if let __class = _class {
                if let ___class = __class as? RouterProtocol.Type {
                    ___class.registerRoutableDestination()
                }
            }
        }
        _registrationFinished = true
    }
    
}

