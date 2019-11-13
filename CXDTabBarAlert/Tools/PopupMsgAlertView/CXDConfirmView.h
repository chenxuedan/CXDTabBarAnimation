//
//  CXDConfirmView.h
//  Schedule
//
//  Created by xiao zude on 2018/6/11.
//  Copyright © 2018年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapBtnBlock)(NSInteger tag);

@interface CXDConfirmView : UIView

@property (nonatomic, assign)BOOL isVisible;
@property (nonatomic, copy)TapBtnBlock block;

- (instancetype)initWithTitle:(NSString *)title andContent:(NSString *)content andCancelStr:(NSString *)cancel andOtherBtn:(NSArray *)otherBtns;
- (void)show;
//+ (void)showConfirmViewWithTitle:(NSString *)title andContent:(NSString *)content andCancelStr:(NSString *)cancel andOtherBtn:(NSArray *)otherBtns;
//
//+ (void)showConfirmViewWithImage:(NSString *)image andContent:(NSString *)content andCancelStr:(NSString *)cancel andOtherBtn:(NSArray *)otherBtns;

@end
