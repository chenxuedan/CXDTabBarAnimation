//
//  CXDIconView.h
//  CXDTabBarAlert
//
//  Created by chenxuedan on 2019/11/12.
//  Copyright © 2019 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXDIconView : UIView

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
- (void)playBounceAnimation;
- (void)playImageBounceAnimation;

@end

NS_ASSUME_NONNULL_END
