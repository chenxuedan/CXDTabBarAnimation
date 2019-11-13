//
//  UIImage+CXDImageColor.h
//  Package
//
//  Created by 陈雪丹 on 2018/4/27.
//Copyright © 2018年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CXDImageColor)

//使用对应的颜色生成相应的图片
+ (UIImage *)imageCreateWithColor:(UIColor *)color;
//修改图片颜色
- (UIImage *)imageModificationWithColor:(UIColor *)color;

+ (UIImage *)resizeWithImage2:(UIImage *)image;
- (UIImage *)rescaleImageToSize:(CGSize)size;

//返回一张不超过屏幕尺寸的 image
+ (UIImage *)imageSizeWithScreenImage:(UIImage *)image;


@end
