//
//  Router.swift
//  Router
//
//  Created by chenminjie on 2021/1/4.
//

import Foundation

/*
 该类可以用于组件之间通信， 统一使用 url这种方式 exp. "appscheme://path/action?key1=value&key2=value"
 */
public class Router: NSObject {
    
    /// 跳转方式
    public enum JumpWay{
        case push
        case presentModally
        case custom
    }
    
    public enum RouterHandleError: Error {
        ///非法的url
        case invalidURL(String)
        ///未能找到匹配的URL
        case unfindURL
    }
    
    ///单例
    public static let `default` = Router()
    
    /// 路由管理
    private var routerManager = RouterUrlManager()
    /// 服务管理
    private var serviceManager = RouterServiceManager()

}

public extension Router {
    
    /// 自动注册
    static func autoRegister() {
        RouterRegistry.registerAll()
    }
}
public extension Router {
    
    /// 注册url
    ///
    /// - Parameters:
    ///   - string: url
    static func register(url string: URLConvertiable, action: @escaping ((RouterConfig?) -> Void)) {
        Router.default.routerManager.register(url: string, action: action)
    }
    
    /// 处理 url
    ///
    /// - Parameters:
    ///   - url: url
    ///   - extenedParameters: 扩展属性
    ///   - didCallback: 会不会执行回调看register的时候有没有调用
    static func handle(url: URLConvertiable?, extened parameters: [String: Any]? = nil, completion: (([String : Any]?) -> Void)? = nil, from viewController: UIViewController?, didCallback:(([String : Any]?) -> Void)?) {
        return Router.default.routerManager.handle(url: url, extened: parameters, completion: completion, from: viewController, didCallback: didCallback)
    }

}

public extension Router {
    
    /// 注册服务
    /// - Parameters:
    ///   - routableService: 协议类型
    ///   - serviceClass: 实现类
    static func register<Protocol,T: NSObject>(_ routableService: RoutableService<Protocol>, forMakingService serviceClass: T.Type) where T: RouterProtocol {
        Router.default.serviceManager.register(routableService, forMakingService: serviceClass)
    }
    
    /// 创建服务
    /// - Parameter routableService: 服务的协议
    /// - Returns: 服务
    static func makeDestination<Protocol>(to routableService: RoutableService<Protocol>) -> Protocol? {
        return Router.default.serviceManager.makeDestination(to: routableService)
    }
}
