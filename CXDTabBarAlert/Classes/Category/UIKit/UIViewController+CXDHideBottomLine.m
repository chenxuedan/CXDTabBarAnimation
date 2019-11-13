//
//  UIViewController+CXDHideBottomLine.m
//  Schedule
//
//  Created by chenxuedan on 2018/10/31.
//Copyright © 2018年 cxd. All rights reserved.
//

#import "UIViewController+CXDHideBottomLine.h"

@implementation UIViewController (CXDHideBottomLine)

- (void)CXD_hideBottomLineInView:(UIView *)view {
    UIImageView *navBarLineImageView = [self findLineImageViewUnder:view];
    navBarLineImageView.hidden = YES;
}

- (void)CXD_showBottomLineInView:(UIView *)view {
    UIImageView *navBarLineImageView = [self findLineImageViewUnder:view];
    navBarLineImageView.hidden = NO;
}

- (UIImageView *)findLineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findLineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
