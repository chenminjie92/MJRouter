//
//  MJRouterNode.swift
//  Basics
//
//  Created by chenminjie on 2021/1/4.
//

import Foundation

public class RouterConfig: NSObject {
    
    /// 路由名字
    public var url: String?
    /// 注册的url
    public var pattern: String? {
        return url?.components(separatedBy: "?").first?.components(separatedBy: "#").first
    }
    /// 来源
    public var fromViewController: UIViewController?
    /// 参数
    @objc public var userInfo: [String: Any]?
    /// 控制器回调
    public var completion: (([String : Any]?) -> Void)?
    /// 调用的事件
    var action: (([String : Any]?) -> Void)?
    
    init(url: String?) {
        self.url = url
    }
}

class RouterNode {
    /// 路由名字
    var name: String
    /// 子节点 父节点为app://xxx/xx  app
    var subNodes = [String: RouterNode]()
    /// 保存的数据
    var config: RouterConfig?
    /// 调用的事件
    var action: ((RouterConfig?) -> Void)?
    
    init(name: String) {
        self.name = name
    }
}
