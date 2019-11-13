//
//  UIImage+CXDRoundImage.h
//  Schedule
//
//  Created by chenxuedan on 2018/10/25.
//Copyright © 2018年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

struct CXDRadius {
    CGFloat topLeftRadius;
    CGFloat topRightRadius;
    CGFloat bottomLeftRadius;
    CGFloat bottomRightRadius;
};
typedef struct CXDRadius CXDRadius;

static inline CXDRadius CXDRadiusMake(CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomLeftRadius, CGFloat bottomRightRadius) {
    CXDRadius radius;
    radius.topLeftRadius = topLeftRadius;
    radius.topRightRadius = topRightRadius;
    radius.bottomLeftRadius = bottomLeftRadius;
    radius.bottomRightRadius = bottomRightRadius;
    return radius;
}

static inline NSString *NSStringFromCXDRadius(CXDRadius radius) {
    return [NSString stringWithFormat:@"{%.2f, %.2f, %.2f, %.2f}",radius.topLeftRadius, radius.topRightRadius, radius.bottomLeftRadius, radius.bottomRightRadius];
}

@interface UIImage (CXDRoundImage)

- (UIImage *)CXD_setradius:(CGFloat)radius
                      size:(CGSize)size;

- (UIImage *)CXD_setradius:(CGFloat)radius
                      size:(CGSize)size
               contentMode:(UIViewContentMode)contentMode;

+ (UIImage *)CXD_setRadius:(CGFloat)radius
                      size:(CGSize)size
               borderColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth
           backgroundColor:(UIColor *)backgroundColor;

+ (UIImage *)CXD_setCXDRadius:(CXDRadius)radius image:(UIImage *)image size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor withContentMode:(UIViewContentMode)contentMode;

@end
