//
//  ShopCartModuleServiceIMP.h
//  ShopCartModule
//
//  Created by chenminjie on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import "ShopCartViewController.h"
@import Services;

NS_ASSUME_NONNULL_BEGIN

@interface ShopCartViewController (Service)<RouterProtocol>

@end

@interface ShopCartModuleServiceIMP : NSObject<ShopCartModuleService,RouterProtocol>

@end

NS_ASSUME_NONNULL_END
