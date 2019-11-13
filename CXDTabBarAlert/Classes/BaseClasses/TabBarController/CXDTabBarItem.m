//
//  CXDTabBarItem.m
//  CXDTabBarAlert
//
//  Created by xiao zude on 2019/11/11.
//  Copyright © 2019 zxycloud. All rights reserved.
//

#import "CXDTabBarItem.h"

@implementation CXDTabBarItem
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initCommonData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initCommonData];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self = [super initWithTitle:title image:image selectedImage:selectedImage];
    if (self) {
        [self initCommonData];
    }
    return self;
}

- (void)initCommonData {
    
}


@end
