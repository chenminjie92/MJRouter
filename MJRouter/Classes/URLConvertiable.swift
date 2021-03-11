//
//  URLConvertiable.swift
//  MJRouter
//
//  Created by chenminjie on 2021/1/5.
//

/// 可以转换为URL字符串的类型。
import Foundation

public protocol URLConvertiable {
    /// URL
    var urlValue: URL? { get }
    /// URLString
    var urlStringValue: String { get }
    /// 注册的url
    var pattern: String { get }
    /// 节点
    var paths: [String]? {get}
    /// 协议
    var scheme: String? {get}
    var encodeUrl: String? {get}
    
    ///返回URL查询参数。为了方便起见，这个属性永远不会返回' nil '，即使
    /// URL中没有查询字符串。此属性不负责重复的键。
    ///检查重复的键，使用' queryItems '代替。
    ///
    /// - seealso: ' queryItems '
    var queryParameters: [String: Any] { get }
    
    ////返回' URLComponents '实例的' queryItems '属性。
    ///
    /// - seealso: ' queryParameters '
    @available(iOS 8, *)
    var queryItems: [URLQueryItem]? { get }
}

extension URLConvertiable {
    
    public var encodeUrl: String? {
        guard let find = urlStringValue.firstIndex(of: Character("?")) else {
            return urlStringValue
        }
        let pre = String(urlStringValue[urlStringValue.startIndex..<find])
        let query = String(urlStringValue[urlStringValue.index(find, offsetBy: 1)..<urlStringValue.endIndex])
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        return "\(pre)?\(encodedQuery ?? "")"
    }
    
    public var scheme: String? {
        return urlValue?.scheme
    }
    
    public var paths: [String]? {
        guard var _paths: [String] = urlValue?.path.components(separatedBy: "/").filter({ $0.count > 0 })  else {
            return nil
        }
        if let thost: String = urlValue?.host {
            _paths.insert(thost, at: 0)
        }
        return _paths
    }
    
    public var pattern: String {
        return urlStringValue.components(separatedBy: "?").first?.components(separatedBy: "#").first ?? ""
    }
    
    public var queryParameters: [String: Any] {
        var parameters = [String: Any]()
        if let _queryItems = queryItems {
            parameters = _queryItems.reduce(into: [String: String]()) { (result, item) in
                result[item.name] = item.value
            }
        }
        return parameters
    }
    
    @available(iOS 8, *)
    public var queryItems: [URLQueryItem]? {
        return URLComponents(string: self.urlStringValue)?.queryItems
    }
}

extension String: URLConvertiable {
    public var urlValue: URL? {
        if let url = URL(string: self) {
            return url
        }
        var set = CharacterSet()
        set.formUnion(.urlHostAllowed)
        set.formUnion(.urlPathAllowed)
        set.formUnion(.urlQueryAllowed)
        set.formUnion(.urlFragmentAllowed)
        return self.addingPercentEncoding(withAllowedCharacters: set).flatMap { URL(string: $0) }
    }
    
    public var urlStringValue: String {
        return self
    }
}

extension URL: URLConvertiable {
    public var urlValue: URL? {
        return self
    }
    
    public var urlStringValue: String {
        return self.absoluteString
    }
}
