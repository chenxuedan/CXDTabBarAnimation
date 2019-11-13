//
//  UIView+CXDBorder.h
//  Schedule
//
//  Created by chenxuedan on 2018/6/11.
//Copyright © 2018年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CXDLocateTop = 0,
    CXDLocateLeft,
    CXDLocateBottom,
    CXDLocateRight,
} CXDLocateDirection;

@interface UIView (CXDBorder)

/**
 *在 View上面画一条横线
 *1234 上左下右
 */
- (void)drawLineWithColor:(UIColor *)color locate:(CXDLocateDirection)locate andPedding:(NSInteger)pedding;

/**
 *  在view 上画一条横线
 */
- (void)drawLineWithColor:(UIColor *)color andFrame:(CGRect)frame;

@end
