//
//  UIView+CXDBorder.m
//  Schedule
//
//  Created by xiao zude on 2018/6/11.
//Copyright © 2018年 cxd. All rights reserved.
//

#import "UIView+CXDBorder.h"

@implementation UIView (CXDBorder)

- (void)drawLineWithColor:(UIColor *)color locate:(CXDLocateDirection)locate andPedding:(NSInteger)pedding {
    if (!color) {
        color = CXDLightGrayColor;
    }
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = color;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (locate == CXDLocateTop || locate == CXDLocateBottom) {
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(@(pedding));
            make.height.mas_equalTo(@(0.5));
            if (locate == CXDLocateTop) {
                make.top.mas_equalTo(0);
            }else {
                make.bottom.mas_equalTo(0);
            }
        }else {
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(@(pedding));
            make.width.mas_equalTo(@0.5);
            if (locate == CXDLocateLeft) {
                make.left.mas_equalTo(0);
            }else {
                make.right.mas_equalTo(0);
            }
        }
    }];
}

- (void)drawLineWithColor:(UIColor *)color andFrame:(CGRect)frame {
    if (!color) {
        color = CXDTitleColor;
    }
    UIView *lineView = [[UIView alloc] initWithFrame:frame];
    lineView.backgroundColor = color;
    [self addSubview:lineView];
}

@end
