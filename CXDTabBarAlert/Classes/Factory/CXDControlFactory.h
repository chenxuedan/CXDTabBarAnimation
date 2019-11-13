//
//  CXDControlFactory.h
//  CXDAlertView
//
//  Created by xiao zude on 2019/10/31.
//  Copyright © 2019 cxd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXDControlFactory : NSObject

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                            title:(NSString *)title
                       titleColor:(UIColor *)titleColor
                             font:(UIFont *)font;

+ (UILabel *)creteTitleLabelWithFrame:(CGRect)frame
                                title:(NSString *)title;

+ (UILabel *)createContentLabelWithFrame:(CGRect)frame
                                   title:(NSString *)title;
+ (UILabel *)createDetailLabelWithFrame:(CGRect)frame
                                  title:(NSString *)title;

+ (UIButton *)createButtonWithFrame:(CGRect)frame
                              title:(NSString *)title
                               font:(UIFont *)font
                         titleColor:(UIColor *)titleColor;



@end

NS_ASSUME_NONNULL_END
