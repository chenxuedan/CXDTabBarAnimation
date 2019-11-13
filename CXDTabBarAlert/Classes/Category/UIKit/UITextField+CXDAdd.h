//
//  UITextField+CXDAdd.h
//  CodePackaging
//
//  Created by chenxuedan on 2019/2/26.
//Copyright © 2019年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `UITextField`.
 */
@interface UITextField (CXDAdd)
/**
 Set all text selected.
 */
- (void)selectAllText;

/**
 Set text in range selected.
 
 @param range  The range of selected text in a document.
 */
- (void)setSelectedRange:(NSRange)range;

@property (nonatomic, strong)NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
