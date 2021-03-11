//
//  LoginModuleServiceIMP.swift
//  LoginModule
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation
import Services

extension GoodsDetailViewController: RouterProtocol {
    
    static func registerRoutableDestination() {
        RouterHelper.registerController(url: RouterHelper.RegisteredUrl.goodsDetail.rawValue, page: GoodsDetailViewController.self)
    }
    
    static func destination(with configuration: RouterConfig?) -> AnyObject? {
        let goodsId: String = (configuration?.userInfo?["goodsId"] as? String) ?? ""
        let vc = GoodsDetailViewController.init(goodsId)
        return vc
    }
}
