//
//  OCViewController.m
//  MJRouter_Example
//
//  Created by chenminjie on 2021/6/1.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

#import "OCViewController.h"
@import Services;

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"oc控制器";
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)buttonClick {
    [OCRouterHelper openRouterUrl:RouterUrlGoodsDetail fromVc:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
