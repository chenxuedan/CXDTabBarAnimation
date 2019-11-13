//
//  CXDAlertView.h
//  CXDAlertView
//
//  Created by chenxuedan on 2019/10/30.
//  Copyright © 2019 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ButtonClickBlock)(NSUInteger tag);

typedef NS_ENUM(NSUInteger, CXDBackMaskType) {
    CXDBackMaskTypeBlack,
    CXDBackMaskTypeBlurEffect,
};

@interface CXDAlertView : UIView
- (void)showWithTitle:(NSString *)title
         contentTitle:(NSString *)contentTitle
          detailTitle:(NSString *)detailTitle
         cancelButton:(NSString *)cancelTitle
         otherButtons:(NSArray *)otherButtons
           clickBlock:(ButtonClickBlock)clickBlock;

- (void)dismiss;

/// The backview corner radius. default is 6.0.
@property (nonatomic, assign) CGFloat cornerRadius;
/// The backgroud view type. default is CXDBackMaskTypeBlack.
@property (nonatomic, assign) CXDBackMaskType maskType;
/// blackOveray to control your touch event
@property (nonatomic, strong) UIControl *blackOverlay;
///detailLabel title Color
@property (nonatomic, strong) UIColor *detailTitleColor;

@property (nonatomic, assign) BOOL cancelDismiss;

@end

NS_ASSUME_NONNULL_END
