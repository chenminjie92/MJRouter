//
//  RouterServiceManager.swift
//  Router
//
//  Created by chenminjie on 2021/2/4.
//

import Foundation

class RouterServiceManager: NSObject {
    
    /// 服务列表
    private var allServices = [String: NSObject.Type]()
    /// 递归锁
    private var lock = NSRecursiveLock()
    
    /// 注册服务
    /// - Parameters:
    ///   - routableService: 协议类型
    ///   - serviceClass: 实现类
    func register<Protocol,T: NSObject>(_ routableService: RoutableService<Protocol>, forMakingService serviceClass: T.Type) where T: RouterProtocol {
        
        lock.lock()
        allServices[routableService.typeName] = serviceClass
        lock.unlock()
    }
    
    /// 创建服务
    /// - Parameter routableService: 服务的协议
    /// - Returns: 服务
    func makeDestination<Protocol>(to routableService: RoutableService<Protocol>) -> Protocol? {
        guard let serviceClass = allServices[routableService.typeName] else {
            debugPrint("没有获取到对应的类")
            debugPrint(Protocol.self)
            return nil
        }
        return serviceClass.init() as? Protocol
    }
    
    /// oc 注册服务
    /// - Parameters:
    ///   - routableService: 服务
    ///   - serviceClass: 实现类
    @objc func objcRegister(_ routableService: Protocol, forMakingService serviceClass: NSObject.Type) {
        
        lock.lock()
        if let typeName = NSStringFromProtocol(routableService).components(separatedBy: ".").last {
            allServices[typeName] = serviceClass
        }
        lock.unlock()
    }
    
    
    
    /// oc创建服务
    /// - Parameter routableService: 服务的协议
    /// - Returns: 服务
    @objc func objcMakeDestination(to routableService: Protocol) -> AnyObject? {
        
        if let typeName = NSStringFromProtocol(routableService).components(separatedBy: ".").last, let serviceClass = allServices[typeName] {
            return serviceClass.init()
        }
        return nil
    }
}

