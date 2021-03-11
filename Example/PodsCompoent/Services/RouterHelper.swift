//
//  RouterHelper.swift
//  Services
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation
import MJRouter

public class RouterHelper {
    
    /// 注册服务
    /// - Parameters:
    ///   - routableService: 服务协议
    ///   - serviceClass: 服务协议实现类
    public static func register<Protocol,T: NSObject>(_ routableService: RoutableService<Protocol>, forMakingService serviceClass: T.Type) where T: RouterProtocol {
        Router.register(routableService, forMakingService: serviceClass)
    }
    
    /// 创建服务
    /// - Parameter routableService: 服务的协议
    /// - Returns: 服务
    public static func makeDestination<Protocol>(to routableService: RoutableService<Protocol>) -> Protocol? {
        return Router.makeDestination(to: routableService)
    }
    
    /// map contorller
    ///
    /// - Parameters:
    ///   - string: url
    ///   - page: controller
    public static func registerController<T: UIViewController>(url string: URLConvertiable, page: T.Type) where T: RouterProtocol {
        Router.registerController(url: string, page: page)
    }
    public static func registerCustomController<T: UIViewController>(url string: URLConvertiable, page: T.Type, action: @escaping ((RouterConfig?) -> Void)) where T: RouterProtocol {
        Router.registerCustomController(url: string, page: page, action: action)
    }
    
    /// 打开本地路由
    /// - Parameters:
    ///   - helperUrl: 路由枚举
    ///   - vc: 导航栏
    public static func open(router helperUrl: RouterHelperUrl, completion: (([String: Any]?) -> Void)? = nil, from vc: UIViewController?) {
        if let _vc = vc {
            if helperUrl.isLogin {
                let service = Router.makeDestination(to: RoutableService<LoginModuleService>())
                service?.doActionIfLogined(formVc: _vc, execute: { (isLogin) in
                    if isLogin {
                        Router.open(url: helperUrl.pattern, extened: helperUrl.params, completion: completion, jumpWay: helperUrl.jumpWay, from: vc, animated: true)
                    }
                })
            }
            else {
                Router.open(url: helperUrl.pattern, extened: helperUrl.params, completion: completion, jumpWay: helperUrl.jumpWay, from: vc, animated: true)
            }
        }
    }
    
    /// 直接通过url打开
    /// - Parameters:
    ///   - linkUrl: 链接地址
    ///   - params: 参数
    ///   - vc: 来源控制器
    public static func open(router linkUrl: String?,params: [String: Any]? = nil, from vc: UIViewController?) {
        guard let _linkUrl = linkUrl else {
            return
        }
        Router.open(url: _linkUrl, extened: params, completion: nil, jumpWay: .push, from: vc, animated: true)

        
    }
    
    
    public enum RouterHelperUrl {
        case user
        case goodsDetail(goodsId: String)
        
        var pattern: String {
            switch self {
            case .user:
                return RegisteredUrl.user.rawValue
            case .goodsDetail(_):
                return RegisteredUrl.goodsDetail.rawValue
            }
        }
        /// 参数
        var params: [String: Any]? {
            switch self {
            case .goodsDetail(let goodsId):
                return ["goodsId": goodsId]
            default:
                return nil
            }
        }
            
        var jumpWay: Router.JumpWay {
            switch self {
            default:
                return .push
            }
        }
            
        var isLogin: Bool {
            switch self {
            case .user:
                return true
            default:
                return false
            }
        }
    }
    
    /// 注册
    public enum RegisteredUrl: String {
        case user = "mj://user/center"
        case goodsDetail = "mj://goods/detail"
    }
}
