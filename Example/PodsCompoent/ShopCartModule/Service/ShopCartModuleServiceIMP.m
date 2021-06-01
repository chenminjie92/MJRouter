//
//  ShopCartModuleServiceIMP.m
//  ShopCartModule
//
//  Created by chenminjie on 2021/6/1.
//

#import "ShopCartModuleServiceIMP.h"

@implementation ShopCartViewController (Service)

+ (void)registerRoutableDestination {
    [OCRouterHelper registerController:RouterUrlShopCart page:[ShopCartViewController class]];
}

+ (id _Nullable)destinationWith:(RouterConfig * _Nullable)configuration {
    ShopCartViewController *vc = [ShopCartViewController new];
    return vc;
}

@end

@implementation ShopCartModuleServiceIMP

+ (void)registerRoutableDestination {
    [Router objcRegister:@protocol(ShopCartModuleService) forMakingService:[ShopCartModuleServiceIMP class]];
}

+ (id _Nullable)destinationWith:(RouterConfig * _Nullable)configuration {
    return nil;
}
- (NSArray *)getShopCartList {
    return @[@"1",@"2",@"3"];
}

@end


