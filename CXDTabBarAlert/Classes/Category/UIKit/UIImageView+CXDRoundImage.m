//
//  UIImageView+CXDRoundImage.m
//  Schedule
//
//  Created by chenxuedan on 2018/10/25.
//Copyright © 2018年 cxd. All rights reserved.
//

#import "UIImageView+CXDRoundImage.h"

@implementation UIImageView (CXDRoundImage)

- (void)CXD_setImageWithCornerRadius:(CGFloat)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder size:(CGSize)size {
    [self CXD_setImageWithCXDRadius:CXDRadiusMake(radius, radius, radius, radius) imageURL:imageURL placeholder:placeholder borderColor:nil borderWidth:0 backgroundColor:nil contentMode:UIViewContentModeScaleAspectFill size:size];
}

- (void)CXD_setImageWithCornerRadius:(CGFloat)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    [self CXD_setImageWithCXDRadius:CXDRadiusMake(radius, radius, radius, radius) imageURL:imageURL placeholder:placeholder borderColor:nil borderWidth:0 backgroundColor:nil contentMode:contentMode size:size];
}

- (void)CXD_setImageWithCXDRadius:(CXDRadius)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    [self CXD_setImageWithCXDRadius:radius imageURL:imageURL placeholder:placeholder borderColor:nil borderWidth:0 backgroundColor:nil contentMode:contentMode size:size];
}

- (void)CXD_setImageWithCXDRadius:(CXDRadius)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
//    NSString *cacheUrlStr = [NSString stringWithFormat:@"%@%@",imageURL,@"radiusCache"];
//    //SDWebImage 版本
//    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheUrlStr];
//    
//    if (cacheImage) {
//        self.image = [UIImage CXD_setCXDRadius:radius image:cacheImage size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
//        return;
//    }
//    
//    UIImage *placeholderImage;
//    if (placeholder || borderWidth > 0 || backgroundColor) {
//        NSString *placeholderKey = [NSString stringWithFormat:@"%@-%@",placeholder,placeholder];
//        placeholderImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:placeholderKey];
//        
//        if (!placeholderImage) {
//            placeholderImage = [UIImage CXD_setCXDRadius:radius image:[UIImage imageNamed:placeholder] size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
//            [[SDImageCache sharedImageCache] storeImage:placeholderImage forKey:placeholderKey completion:nil];
//        }else {
//            placeholderImage = [UIImage CXD_setCXDRadius:radius image:placeholderImage size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
//        }
//    }
//    
//    self.image = placeholderImage;
//    
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    [manager loadImageWithURL:imageURL options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
//        //处理下载进度
//    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
//        if (image) {
//            UIImage *currentImage = [UIImage CXD_setCXDRadius:radius image:image size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
//            self.image = currentImage;
//            [[SDImageCache sharedImageCache] storeImage:currentImage forKey:cacheUrlStr toDisk:YES completion:nil];
//            //清除原有非圆角图片缓存
//            [[SDImageCache sharedImageCache] removeImageForKey:[NSString stringWithFormat:@"%@",imageURL] withCompletion:nil];
//        }
//    }];
    
}

@end
