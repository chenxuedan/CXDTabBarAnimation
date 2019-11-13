//
//  CXDMainNavigationController.h
//  CXDTabBarAlert
//
//  Created by chenxuedan on 2019/11/11.
//  Copyright © 2019 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXDMainNavigationController : UINavigationController

///导航栏分割线
@property (nonatomic, weak, readonly) UIImageView *navSystemLine;

///显示导航栏的细线
- (void)showNavigationSystemLine;
///隐藏导航栏的细线
- (void)hideNavigationSystemLine;

@end

NS_ASSUME_NONNULL_END
