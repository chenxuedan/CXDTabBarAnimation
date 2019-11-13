//
//  CXDNoticeView.m
//  Schedule
//
//  Created by chenxuedan on 2018/6/11.
//  Copyright © 2018年 cxd. All rights reserved.
//

#import "CXDNoticeView.h"
#import "NSString+CXDAdd.h"

//弹出框动画时间
#define CXDAnimationTime 0.25f
//提示框显示时间
#define CXDAlertViewShowTime 2.5f

static CXDNoticeView *_sharedNoticeView = nil;

@interface CXDNoticeView ()

@property (nonatomic, strong)NSTimer *timer;

@end

@implementation CXDNoticeView
+ (instancetype)sharedNoticeView {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNoticeView = [[super allocWithZone:NULL] initWithFrame:CGRectMake(kScreenWidth / 4, kScreenHeight / 3, kScreenWidth / 2, 40)];
        _sharedNoticeView.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 3);
        _sharedNoticeView.font = [UIFont systemFontOfSize:13];
        _sharedNoticeView.backgroundColor = [UIColor blackColor];
        _sharedNoticeView.alpha = 0.f;
        _sharedNoticeView.textColor = [UIColor whiteColor];
        _sharedNoticeView.numberOfLines = 0;
        _sharedNoticeView.textAlignment = NSTextAlignmentCenter;
        _sharedNoticeView.layer.masksToBounds = YES;
        _sharedNoticeView.layer.cornerRadius = 5.0f;
    });
    return _sharedNoticeView;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    UIFont *tfont = [UIFont systemFontOfSize:13];
    //iOS 7方法，获取文本需要的size，限制宽度
    CGSize actualSize = [text sizeForFont:tfont size:CGSizeMake(kScreenWidth - 64, MAXFLOAT) mode:NSLineBreakByWordWrapping];
    //更新UILabel 的bounds
    self.bounds = CGRectMake(0, 0, actualSize.width + 32, MAX(40, actualSize.height + 16));
}

- (void)showNoticeViewWithString:(NSString *)notice {
    if (self.superview) {
        [self removeTimer];
    }
    _sharedNoticeView.timer = [NSTimer scheduledTimerWithTimeInterval:CXDAlertViewShowTime target:[CXDNoticeView class] selector:@selector(hideNoticeView) userInfo:nil repeats:NO];
    self.text = notice;
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [UIView animateWithDuration:CXDAnimationTime * 2 animations:^{
        self.alpha = 0.8f;
    }];
}

+ (void)showNoticeViewWithString:(NSString *)notice {
    if (![notice isKindOfClass:[NSString class]]) {
        notice = @"提示不是字符串";
    }else {
        [[self sharedNoticeView] showNoticeViewWithString:notice];
    }
}

- (void)removeTimer {
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

+ (void)hideNoticeView {
    [[self sharedNoticeView] hideNoticeView];
}

- (void)hideNoticeView {
    if (!self.superview) {
        return;
    }
    [UIView animateWithDuration:CXDAnimationTime * 2 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeTimer];
            [self removeFromSuperview];
        }
    }];
}

@end
