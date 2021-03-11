//
//  RouterUrlManager.swift
//  Router
//
//  Created by chenminjie on 2021/2/4.
//

import Foundation

class RouterUrlManager: NSObject {
    
    /// 注册的列表
    fileprivate var allRouters = [String: RouterNode]()
    
    
    /// 处理url
    /// - Parameters:
    ///   - url: url
    ///   - parameters: 参数
    ///   - completion: 回调
    ///   - didCallback: 创建回调
    func handle(url: URLConvertiable?, extened parameters: [String: Any]? = nil, completion: (([String : Any]?) -> Void)?,from viewController: UIViewController?, didCallback: (([String : Any]?) -> Void)?) {
        
        guard url != nil else {
            return
        }
        
        guard (url?.encodeUrl) != nil else {
            return
        }
        
        guard let scheme = url?.scheme else {
            return
        }
        
        guard var paths = url?.paths, paths.count > 0 else {
            return
        }
        
        guard let schemeNode = allRouters[scheme] else {
            return
        }
        guard let tailNode = findTailNode(next: schemeNode, paths: &paths, index: 0) else {
            return
        }
        var queryParameters = url?.queryParameters
        if let _parameters = parameters {
            queryParameters?.merge(_parameters, uniquingKeysWith: { (queryParametersValue, parametersValue) -> Any in
                return queryParametersValue
            })
        }
        tailNode.config?.fromViewController = viewController
        tailNode.config?.userInfo = queryParameters
        tailNode.config?.completion = completion
        tailNode.config?.action = didCallback
        tailNode.action?(tailNode.config)
    }
    
    /// 注册url
    /// - Parameters:
    ///   - url: url
    ///   - action: 创建回调
    func register(url: URLConvertiable, action: @escaping ((RouterConfig?) -> Void)) {
        guard (url.urlValue) != nil else {
            assertionFailure("Router invalid url!" + url.urlStringValue)
            return
        }
        guard let scheme = url.scheme else {
            assertionFailure("Router url must be have scheme" + url.urlStringValue)
            return
        }
        guard var paths = url.paths, paths.count > 0 else {
            assertionFailure("Router url must be have path" + url.urlStringValue)
            return
        }
        
        if allRouters[scheme] == nil {
            let schemeNode = RouterNode(name: scheme)
            allRouters[scheme] = schemeNode
        }
        let schemeNode: RouterNode? = allRouters[scheme]
        let tailNode = parse(next: schemeNode, paths: &paths, index: 0)
        
        if tailNode.config != nil {
            assertionFailure("Router url had been added")
        }
        tailNode.config = RouterConfig.init(url: url.urlStringValue)
        tailNode.action = action
    }
}

private extension RouterUrlManager {

    ///创建节点
    func parse(next: RouterNode?, paths: inout [String], index: Int) -> RouterNode {
        let component = paths[index]
        var nextNode: RouterNode? = next?.subNodes[component]
        if nextNode == nil {
            nextNode = RouterNode(name: component)
            next?.subNodes[component] = nextNode!
        }
        
        if index == paths.count - 1 {
            return nextNode!
        }
        
        return parse(next: nextNode, paths: &paths, index: index + 1)
    }
    
    ///找尾节点
    func findTailNode(next: RouterNode, paths: inout [String], index: Int) -> RouterNode? {
        let component = paths[index]
        guard let nextNode = next.subNodes[component] else {
            return nil
        }
        
        if index == paths.count - 1 {
            return nextNode
        }
        
        return findTailNode(next: nextNode, paths: &paths, index: index + 1)
    }
    
}


