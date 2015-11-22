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

- (void)loadView
{
    [super loadView];
    
    NSLog(@"%s, %@", __FUNCTION__, self);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*遍历子视图*/
    for (UIView *aView in [self.navigationBar subviews])
    {
    }
    
    /*若子视图里还有子视图,则:*/
    for (UIView *aView in [self.navigationBar subviews])
    {
        for (UIView *bView in [aView subviews])
        {
        }
    }

    
    for (UIView *barSub in self.navigationBar.subviews) {
        if ([barSub isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            
            CGRect frame = barSub.frame;
            frame.size.height = 20;
            barSub.frame = frame;
            
            NSLog(@"%s, %@", __FUNCTION__, barSub);
            
            
        }
        
        
        if ([barSub isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {

            NSLog(@"%s, %@", __FUNCTION__, barSub);
        }
    }
    
    
    [self.navigationController  setToolbarHidden:NO animated:YES];  
}



/*递归（深度优先算法）*/
-(void)allview:(UIView *)rootview indent:(NSInteger)indent
{
    NSLog(@"[%2ld] %@",(long)indent,rootview);
    indent++;
    for (UIView *aview in [rootview subviews])
    {
        [self allview:aview indent:indent];
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
}


@end
