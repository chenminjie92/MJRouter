//
//  RouterProtocol.swift
//  MJRouter
//
//  Created by chenminjie on 2021/1/5.
//

import Foundation

@objc public protocol RouterProtocol {
    
    /// 注册
    @objc static func registerRoutableDestination()
    /// 目的地
    @objc static func destination(with configuration: RouterConfig?) -> AnyObject?
}

public struct RoutableService<Protocol> {
    
    /// 协议的名字
    let typeName: String
   
    public init() {
        typeName = String(describing: Protocol.self)
    }
}
