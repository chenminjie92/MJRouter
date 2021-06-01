//
//  ShopCartModuleService.h
//  Services
//
//  Created by chenminjie on 2021/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ShopCartModuleService <NSObject>
/// 获取购物车列表
- (NSArray *)getShopCartList;

@end


NS_ASSUME_NONNULL_END
