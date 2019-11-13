//
//  UIButton+CXDCategory.h
//  AgentApplication
//
//  Created by 陈雪丹 on 2017/4/13.
//  Copyright © 2017年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CXDCategory)

@property (nonatomic, strong)NSIndexPath *indexPath;

- (void)setLeftSideRadius:(CGFloat)radius;
- (void)setRightSideRadius:(CGFloat)radius;
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
