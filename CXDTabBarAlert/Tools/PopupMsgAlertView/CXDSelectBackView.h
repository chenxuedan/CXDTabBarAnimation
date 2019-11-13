//
//  CXDSelectBackView.h
//  Schedule
//
//  Created by xiao zude on 2018/6/12.
//  Copyright © 2018年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXDSelectBackView : UIView

//default
+ (instancetype)defaultBackgroundView;
//center
+ (void)exchangeTopViewWith:(UIView *)newView isTouchHide:(BOOL)isTouchHidden;
//bottom
+ (void)presentTopViewWith:(UIView *)view isTouchHide:(BOOL)isTouchHidden;
//right
+ (void)showFilterViewWith:(UIView *)view isTouchHide:(BOOL)isTouchHidden;
//hide
+ (void)hideView;

@end
