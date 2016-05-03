//
//  NavigationController.m
//  STNavgationBar
//
//  Created by rkxt_ios on 15/11/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

//- (void)loadView
//{
//    [super loadView];
//    
//    NSLog(@"%s, %@", __FUNCTION__, self);
//}

- (void)loadView
{
    [super loadView];
    [self.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationBar setShadowImage:[UIImage new]];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setShadowImage:[UIImage new]];

     [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    /*遍历子视图*/
//    for (UIView *aView in [self.navigationBar subviews])
//    {
//    }
//    
//    /*若子视图里还有子视图,则:*/
//    for (UIView *aView in [self.navigationBar subviews])
//    {
//        for (UIView *bView in [aView subviews])
//        {
//        }
//    }
//
////    [self.navigationBar setAlpha:1];
//    
//
//    
//    [self.navigationBar setBackgroundColor:[UIColor blueColor]];
//    [self.navigationBar setAlpha:0.9];
////    NSLog(@"%s, %@", __FUNCTION__, self.navigationBar);
//    
//    for (UIView *barSub in self.navigationBar.subviews) {
////        [barSub setOpaque:NO];
////        [barSub setAlpha:0];
//        NSLog(@"%s, %@", __FUNCTION__, barSub);
//        
//        
//        if ([barSub isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
//            NSLog(@"%s, %lu", __FUNCTION__, (unsigned long)barSub.subviews.count);
//            NSLog(@"%s, %@", __FUNCTION__, barSub.subviews);
//            
//            
//            UIImageView *image = barSub.subviews[0];
////            [image setBackgroundColor:[UIColor yellowColor]];
//            image.layer.backgroundColor = [UIColor yellowColor].CGColor;
//            
//            
//        }
//        
//        
//        if ([barSub isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {
//
//            NSLog(@"%s, %@", __FUNCTION__, barSub);
//        }
//    }
//    
//    
//    [self.navigationController  setToolbarHidden:NO animated:YES];  
}



///*递归（深度优先算法）*/
//-(void)allview:(UIView *)rootview indent:(NSInteger)indent
//{
//    NSLog(@"[%2ld] %@",(long)indent,rootview);
//    indent++;
//    for (UIView *aview in [rootview subviews])
//    {
//        [self allview:aview indent:indent];
//    }
//}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
}


@end
