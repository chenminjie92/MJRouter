//
//  OCRouterHelper.m
//  Services
//
//  Created by chenminjie on 2021/6/1.
//

#import "OCRouterHelper.h"
#import <Services/Services-Swift.h>

@implementation OCRouterHelper

+(NSString *)getLinkUrlForRouterUrl:(RouterUrl)routerUrl {
    switch (routerUrl) {
        case RouterUrlUser:
            return @"mj://user/center";
        case RouterUrlGoodsDetail:
            return @"mj://goods/detail";
        case RouterUrlShopCart:
            return @"mj://shopCart/index";
        default:
            return @"";
    }
}
+ (BOOL)getIsloginForRouterUrl:(RouterUrl)routerUrl {
    switch (routerUrl) {
        case RouterUrlShopCart:
            return YES;
        case RouterUrlUser:
            return YES;
        default:
            return NO;
    }
}

+ (void)registerController: (RouterUrl)routerUrl page: (Class)page; {
    
    [Router objcRegisterControllerWithUrl:[OCRouterHelper getLinkUrlForRouterUrl:routerUrl] page:page];
}
+ (void)openRouterUrl: (RouterUrl)routerUrl fromVc: (UIViewController *)fromVc; {
    [OCRouterHelper openRouterUrl:routerUrl parmas:nil fromVc:fromVc completion:nil];
}
+ (void)openRouterUrl: (RouterUrl)routerUrl parmas:(nullable NSDictionary<NSAttributedStringKey,id> *)parmas fromVc: (UIViewController *)fromVc completion:(nullable void (^)(NSDictionary<NSAttributedStringKey,id> *))completion {
    
    if ([OCRouterHelper getIsloginForRouterUrl:routerUrl]) {

        id<LoginModuleService> service = [Router objcMakeDestination:@protocol(LoginModuleService)];
        if (service) {
            [service doActionIfLoginedWithFormVc:fromVc execute:^(BOOL isLogin) {
                if (isLogin) {
                    [OCRouterHelper openLinkUrl:[OCRouterHelper getLinkUrlForRouterUrl:routerUrl] parmas:parmas fromVc:fromVc completion:completion];
                }
            }];
        }
    }else {
        [OCRouterHelper openLinkUrl:[OCRouterHelper getLinkUrlForRouterUrl:routerUrl] parmas:parmas fromVc:fromVc completion:completion];
    }
    
}
+ (void)openRouterUrl: (RouterUrl)routerUrl parmas:(nullable NSDictionary<NSAttributedStringKey,id> *)parmas fromVc: (UIViewController *)fromVc {
    if ([OCRouterHelper getIsloginForRouterUrl:routerUrl]) {
        id<LoginModuleService> service = [Router objcMakeDestination:@protocol(LoginModuleService)];
        if (service) {
            [service doActionIfLoginedWithFormVc:fromVc execute:^(BOOL isLogin) {
                if (isLogin) {
                    [OCRouterHelper openRouterUrl:routerUrl parmas:parmas fromVc:fromVc completion:nil];
                }
            }];
        }
    }else {
        [OCRouterHelper openRouterUrl:routerUrl parmas:parmas fromVc:fromVc completion:nil];
    }
}

+ (void)openLinkUrl:(NSString *)linkUrl parmas:(nullable NSDictionary<NSAttributedStringKey,id> *)parmas fromVc: (UIViewController *)fromVc completion:(nullable void (^)(NSDictionary<NSAttributedStringKey,id> *))completion {
    
    if (linkUrl != nil && linkUrl.length > 0) {
        [Router objcOpenWithUrl:linkUrl extened:parmas completion:completion jumpWay:JumpWayPush from:fromVc animated:YES];
    };
}

@end
