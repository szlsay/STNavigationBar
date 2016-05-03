//
//  ViewController.m
//  STNavigationBar
//
//  Created by rkxt_ios on 15/11/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self.view setBackgroundColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTranslucent:NO];
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    NSLog(@"%s, %@", __FUNCTION__, self.navigationController.navigationBar.subviews);
}


@end
