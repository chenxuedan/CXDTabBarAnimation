//
//  CXDMainTabBarController.h
//  CXDTabBarAlert
//
//  Created by xiao zude on 2019/11/11.
//  Copyright © 2019 zxycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TabBarDoubleClickDelegate <NSObject>

- (void)tabBarDoubleClick;

@end

@interface CXDMainTabBarController : UITabBarController

@property (nonatomic, weak) id <TabBarDoubleClickDelegate> doubleDelegate;

@property (nonatomic, readwrite, strong) NSArray <UIViewController *> *tabBarViewControllers;

@property (nonatomic, readwrite, assign) UIEdgeInsets imageInsets;
@property (nonatomic, readwrite, assign) UIOffset titlePositionAdjustment;


- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers;

+ (instancetype)tabBarControllerWithViewControllers:(NSArray<UIViewController *>*)viewControllers;

@end

NS_ASSUME_NONNULL_END
