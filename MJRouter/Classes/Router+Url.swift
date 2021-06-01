//
//  Router+Registered.swift
//  Extensions
//
//  Created by chenminjie on 2021/1/4.
//

import UIKit

extension Router {
    
    static let PageKey = "controller"
    /// 注册
    /// - Parameter string: 路由地址
    public static func registerController<T: UIViewController>(url string: URLConvertiable, page: T.Type) where T: RouterProtocol {
        
        Router.register(url: string) { (config) in
            let vc = page.destination(with: config)
            config?.action?([PageKey: vc as Any])
        }
    }
    
    @objc public static func objcRegisterController(url string: String, page: UIViewController.Type) {
        
        Router.register(url: string) { (config) in
            page.conforms(to: RouterProtocol.self)
            if let _page = page as? RouterProtocol.Type {
                let vc = _page.destination(with: config)
                config?.action?([PageKey: vc as Any])
            }
        }
    }
    
    /// 自定义注册
    /// - Parameters:
    ///   - string: 路由地址
    ///   - page: 控制器
    public static func registerCustomController<T: UIViewController>(url string: URLConvertiable, page: T.Type, action: @escaping ((RouterConfig?) -> Void)) where T: RouterProtocol {
        
        Router.register(url: string, action: action)
    }
    
    
    /// 打开控制器
    /// - Parameters:
    ///   - string: 路由地址
    ///   - parameters: 参数
    ///   - completion: 回调
    ///   - jumpWay: 跳转方式
    ///   - nav: 控制器
    ///   - animated: 是否动画
    public static func open(url string: URLConvertiable, extened parameters: [String: Any]? = nil, completion: (([String : Any]?) -> Void)? = nil, jumpWay: JumpWay = .push, from viewController: UIViewController?, animated: Bool = true) {
        
        Router.handle(url: string, extened: parameters, completion: completion, from: viewController) { (userInfo) in
            switch jumpWay {
            case .push:
                if let vc = userInfo?[PageKey] as? UIViewController {
                    viewController?.navigationController?.pushViewController(vc, animated: animated)
                }
            case .presentModally:
                if let vc = userInfo?[PageKey] as? UIViewController {
                    viewController?.navigationController?.present(vc, animated: animated, completion: nil)
                }
            case .custom:
                break
            }
        }
    }
    
    @objc public static func objcOpen(url string: String?, extened parameters: [String: Any]? = nil, completion: (([String : Any]?) -> Void)? = nil, jumpWay: JumpWay = .push, from viewController: UIViewController?, animated: Bool = true) {
        
        Router.handle(url: string, extened: parameters, completion: completion, from: viewController) { (userInfo) in
            
            switch jumpWay {
            case .push:
                if let vc = userInfo?[PageKey] as? UIViewController {
                    viewController?.navigationController?.pushViewController(vc, animated: animated)
                }
            case .presentModally:
                if let vc = userInfo?[PageKey] as? UIViewController {
                    viewController?.navigationController?.present(vc, animated: animated, completion: nil)
                }
            case .custom:
                break
            }
        }
    }
}
