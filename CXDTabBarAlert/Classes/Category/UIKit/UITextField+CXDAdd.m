//
//  UITextField+CXDAdd.m
//  CodePackaging
//
//  Created by xiao zude on 2019/2/26.
//Copyright © 2019年 cxd. All rights reserved.
//

#import "UITextField+CXDAdd.h"
#import "CXDKitMacro.h"
#import <objc/runtime.h>

CXDSYNTH_DUMMY_CLASS(UITextField_CXDAdd)

static void *indexPathKey = &indexPathKey;

@implementation UITextField (CXDAdd)

- (void)selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

- (NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, indexPathKey);
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, indexPathKey, indexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
