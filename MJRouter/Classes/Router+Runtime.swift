//
//  Route+Runtime.swift
//  Router
//
//  Created by chenminjie on 2021/1/4.
//

import Foundation

extension Router {
    
    /// 获取遵循xx协议的类
    /// - Parameter classProtocol: 协议
    /// - Returns: 结果
    static func getClassList(_ classProtocol:Protocol)-> [AnyClass?] {
        var anyClass: [AnyClass?] = []
        /// 该函数的作用是获取已经注册的类，它需要传入两个参数，第一个参数 buffer ：已分配好内存空间的数组，第二个参数 bufferCount ：数组中可存放元素的个数，返回值是注册的类的总数。
        ///1. 函数是为了获取到当前注册的所有类的总个数
        let numClasses: Int32 = objc_getClassList(nil, 0)
        let allClasses = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(numClasses))
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
        let actualClassCount:Int32 = objc_getClassList(autoreleasingAllClasses, numClasses);
        for i in 0..<actualClassCount {
            let aClass: AnyClass? = allClasses[Int(i)]
            if class_conformsToProtocol(aClass, classProtocol) {
                anyClass.append(aClass)
            }
        }
        return anyClass
    }
    
   
}
