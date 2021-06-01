//
//  UserModuleService.swift
//  Services
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation

/// 用户模块
public protocol UserModuleService: AnyObject {
    
    /// 根据用户id获取用户信息
    func getUserInfo(for userId: String, result: ((_ userInfo: [String: Any]) -> Void))

}

