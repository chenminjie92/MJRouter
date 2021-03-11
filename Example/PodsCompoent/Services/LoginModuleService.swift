//
//  LoginModuleService.swift
//  MJRouter
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation

/// 登录模块
public protocol LoginModuleService: class {
    
    /// 用户是否登录
    var isLogin: Bool {get}
    
    /// 获取用户token
    var token: String? {get}
    /// 获取用户id
    var userId: String? {get}
    /// 推出登录
    func logout()
    /// 获取登录状态 未登录跳转登录页面
    /// - Parameter execute: 回调
    @discardableResult
    func doActionIfLogined(formVc: UIViewController, execute:((_ isAlreadyLogin: Bool) -> Void)?) -> Bool
}
