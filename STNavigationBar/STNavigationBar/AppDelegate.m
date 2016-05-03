//
//  AppDelegate.m
//  STNavigationBar
//
//  Created by rkxt_ios on 15/11/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationController.h"
#import "View1Controller.h"
#import "ZGNavigationBarTitleViewController.h"
#import "ZGViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:[View1Controller new]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
//    // Override point for customization after application launch.
//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
//        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//        [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithWhite:.6 alpha:0.4]];
//    }
//    else {
//        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
//    }
//    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    ZGNavigationBarTitleViewController *nav = [[ZGNavigationBarTitleViewController alloc]initWithRootViewController:[ZGViewController new]];
//    self.window.rootViewController = nav;
//    [self.window makeKeyAndVisible];
    
    
    return YES;

    
    return YES;
}


@end
