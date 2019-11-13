//
//  AppDelegate.m
//  CXDTabBarAlert
//
//  Created by xiao zude on 2019/11/7.
//  Copyright © 2019 zxycloud. All rights reserved.
//

#import "AppDelegate.h"
#import "CXDMainTabBarController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    CXDMainTabBarController *tabBarController = [[CXDMainTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];

    return YES;
}




@end
