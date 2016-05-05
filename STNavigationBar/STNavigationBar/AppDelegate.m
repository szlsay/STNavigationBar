//
//  AppDelegate.m
//  STNavigationBar
//
//  Created by https://github.com/STShenZhaoliang/STNavigationBar on 15/11/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "AppDelegate.h"
#import "TravelNavController.h"
#import "TravelNav0Controller.h"
#import "TravelNav1Controller.h"

#import "BookNavController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];


    // 1.客路的
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[TravelNavController new]];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"demo0" image:nil selectedImage:nil];

    UINavigationController *nav0 = [[UINavigationController alloc]initWithRootViewController:[TravelNav0Controller new]];
    nav0.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"demo1" image:nil selectedImage:nil];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:[TravelNav1Controller new]];
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"demo2" image:nil selectedImage:nil];
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    tabVC.viewControllers = @[nav, nav0, nav1];


    // 2.简书的
    UINavigationController *navBook = [[UINavigationController alloc]initWithRootViewController:[BookNavController new]];

    self.window.rootViewController = navBook;
    [self.window makeKeyAndVisible];

    return YES;
}


@end
