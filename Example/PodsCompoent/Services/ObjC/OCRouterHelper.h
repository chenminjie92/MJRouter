//
//  OCRouterHelper.h
//  Services
//
//  Created by chenminjie on 2021/6/1.
//

#import <Foundation/Foundation.h>
@import MJRouter;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RouterUrl) {
    /// 商品详情
    RouterUrlGoodsDetail = 0,
    /// 用户
    RouterUrlUser = 1,
    /// 购物车
    RouterUrlShopCart = 2
};

@interface OCRouterHelper : NSObject

/// 注册控制器
/// @param routerUrl 路由枚举
/// @param page 对应的控制器
+ (void)registerController: (RouterUrl)routerUrl page: (Class)page;

/// 打开路由
/// @param routerUrl 路由枚举
/// @param fromVc  来源控制器
+ (void)openRouterUrl: (RouterUrl)routerUrl fromVc: (UIViewController *)fromVc;

+ (void)openRouterUrl: (RouterUrl)routerUrl parmas:(nullable NSDictionary<NSAttributedStringKey,id> *)parmas fromVc: (UIViewController *)fromVc;

+ (void)openRouterUrl: (RouterUrl)routerUrl parmas:(nullable NSDictionary<NSAttributedStringKey,id> *)parmas fromVc: (UIViewController *)fromVc completion:(nullable void (^)(NSDictionary<NSAttributedStringKey,id> *))completion;

+ (void)openLinkUrl:(NSString *)linkUrl parmas:(nullable NSDictionary<NSAttributedStringKey,id> *)parmas fromVc: (UIViewController *)fromVc completion:(nullable void (^)(NSDictionary<NSAttributedStringKey,id> *))completion;

@end

NS_ASSUME_NONNULL_END
