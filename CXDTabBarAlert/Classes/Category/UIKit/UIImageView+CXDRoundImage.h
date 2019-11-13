//
//  UIImageView+CXDRoundImage.h
//  Schedule
//
//  Created by xiao zude on 2018/10/25.
//Copyright © 2018年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+CXDRoundImage.h"

@interface UIImageView (CXDRoundImage)

- (void)CXD_setImageWithCornerRadius:(CGFloat)radius
                            imageURL:(NSURL *)imageURL
                         placeholder:(NSString *)placeholder
                                size:(CGSize)size;

- (void)CXD_setImageWithCornerRadius:(CGFloat)radius
                            imageURL:(NSURL *)imageURL
                         placeholder:(NSString *)placeholder
                         contentMode:(UIViewContentMode)contentMode
                                size:(CGSize)size;

- (void)CXD_setImageWithCXDRadius:(CXDRadius)radius
                            imageURL:(NSURL *)imageURL
                         placeholder:(NSString *)placeholder
                         contentMode:(UIViewContentMode)contentMode
                                size:(CGSize)size;

- (void)CXD_setImageWithCXDRadius:(CXDRadius)radius
                         imageURL:(NSURL *)imageURL
                      placeholder:(NSString *)placeholder
                      borderColor:(UIColor *)borderColor
                      borderWidth:(CGFloat)borderWidth
                  backgroundColor:(UIColor *)backgroundColor
                      contentMode:(UIViewContentMode)contentMode
                             size:(CGSize)size;

@end
