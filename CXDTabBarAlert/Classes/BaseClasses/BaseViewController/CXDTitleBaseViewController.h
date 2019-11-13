//
//  CXDTitleBaseViewController.h
//  CXDTabBarAlert
//
//  Created by xiao zude on 2019/11/11.
//  Copyright © 2019 zxycloud. All rights reserved.
//

#import "CXDBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXDTitleBaseViewController : CXDBaseViewController

@property (nonatomic, strong) UIColor *leftTitleColor;
//标题设置，并添加返回事件处理
@property (nonatomic, copy) NSString *leftTitle;

- (void)backToBtnAction;

@end

NS_ASSUME_NONNULL_END
