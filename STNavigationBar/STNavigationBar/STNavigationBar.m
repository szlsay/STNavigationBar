//
//  STNavigationBar.m
//  STNavigationBar
//
//  Created by rkxt_ios on 15/11/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "STNavigationBar.h"

@implementation STNavigationBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
                [view removeFromSuperview];
            }
        }
    }
    return self;
}

- (void)setShadowImage:(UIImage *)shadowImage
{
    shadowImage = [UIImage new];
}

@end
