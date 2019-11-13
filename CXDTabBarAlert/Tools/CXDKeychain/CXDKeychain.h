//
//  CXDKeychain.h
//  FireEyesAssistant
//
//  Created by xiao zude on 2019/6/14.
//  Copyright © 2019 zxycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXDKeychain : NSObject

+ (void)save:(NSString *)service data:(NSData *)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

@end

NS_ASSUME_NONNULL_END
