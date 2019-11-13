//
//  CXDControlFactory.m
//  CXDAlertView
//
//  Created by xiao zude on 2019/10/31.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "CXDControlFactory.h"

@implementation CXDControlFactory

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                            title:(NSString *)title
                       titleColor:(UIColor *)titleColor
                             font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.textColor = titleColor;
    label.font = font;
    return label;
}

+ (UILabel *)creteTitleLabelWithFrame:(CGRect)frame
                                title:(NSString *)title {
    return [self createLabelWithFrame:frame
                                title:title
                           titleColor:CXDTextColor
                                 font:CXDTitleFont];
}

+ (UILabel *)createContentLabelWithFrame:(CGRect)frame
                                   title:(NSString *)title {
    return [self createLabelWithFrame:frame
                                title:title
                           titleColor:CXDContentColor
                                 font:CXDContentFont];
}

+ (UILabel *)createDetailLabelWithFrame:(CGRect)frame
                                  title:(NSString *)title {
    return [self createLabelWithFrame:frame
                                title:title
                           titleColor:CXDDetailColor
                                 font:CXDDetailFont];
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame
                              title:(NSString *)title
                               font:(UIFont *)font
                         titleColor:(UIColor *)titleColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
}

@end
