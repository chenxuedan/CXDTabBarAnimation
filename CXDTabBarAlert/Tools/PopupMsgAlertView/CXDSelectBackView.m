//
//  CXDSelectBackView.m
//  Schedule
//
//  Created by chenxuedan on 2018/6/12.
//  Copyright © 2018年 cxd. All rights reserved.
//

#import "CXDSelectBackView.h"

//弹出框动画时间
#define CXDAnimationTime 0.45f

static CXDSelectBackView *_defaultBackgroundView = nil;

typedef enum : NSUInteger {
    PopViewAnimationRight,
    PopViewAnimationBounceCenter,
    PopViewAnimationBottom,
    PopViewAnimationDefault = PopViewAnimationRight
} PopViewAnimationType;

@interface CXDSelectBackView () <UIGestureRecognizerDelegate>

@property (nonatomic, assign)PopViewAnimationType popViewAnimationType;
@property (nonatomic, assign)NSInteger popHeight;
@property (nonatomic, assign)BOOL isPopping;
@property (nonatomic, assign)BOOL isTouchHidden;
@property (nonatomic, strong)UIView *topView;

@end

@implementation CXDSelectBackView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)]) {
        [self preConfig];
        [self configBlur];
        [self configUnderView];
    }
    return self;
}

+ (instancetype)defaultBackgroundView {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultBackgroundView = [[self alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    });
    return _defaultBackgroundView;
}

- (void)preConfig {
    self.isTouchHidden = YES; //点击底层视图是否消失
    self.popViewAnimationType = PopViewAnimationBounceCenter;
    self.popHeight = CXDButtonHeight;
}

- (void)configBlur {
    self.tintColor = [UIColor clearColor];
}

- (void)configUnderView {
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    underView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.67];
    [self addSubview:underView];
    [underView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBackgroundView:)];
    tap.delegate = self;
    [underView addGestureRecognizer:tap];
}

+ (void)popView {
    [[self defaultBackgroundView] popView];
}

- (void)popView {
    self.isPopping = YES;
    //控制键盘
    [[UIApplication sharedApplication].delegate.window endEditing:NO];
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [self popTopView];
}

- (void)addKeyboardObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

+ (void)exchangeTopViewWith:(UIView *)newView isTouchHide:(BOOL)isTouchHidden {
    [[self defaultBackgroundView] setIsTouchHidden:isTouchHidden];
    [self exchangeTopViewWith:newView];
}

+ (void)exchangeTopViewWith:(UIView *)newView {
    [[self defaultBackgroundView] exchangeTopViewWith:newView];
}

- (void)exchangeTopViewWith:(UIView *)newView {
    [self removeTopView:^{
        self.topView = newView;
        self.popViewAnimationType = PopViewAnimationBounceCenter;
        newView.center = CGPointMake(kScreenWidth / 2,kScreenHeight / 2);
        [self popTopView];
    }];
}

- (void)popTopView {
    if (!self.isPopping) {
        [self popView];
    }
    [self endEditing:YES];
    self.topView.layer.masksToBounds = YES;
    _topView.alpha = 1.0f;
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.popViewAnimationType == PopViewAnimationBottom) {
            make.left.right.equalTo(@(0));
        }else if (self.popViewAnimationType == PopViewAnimationBounceCenter) {
            make.center.equalTo(@(0));
            make.left.equalTo(@(40));
        }else {
            make.top.bottom.equalTo(@(0));
        }
    }];
    [self layoutIfNeeded];
    
    __weak typeof(self) weakSelf = self;
    if (self.popViewAnimationType == PopViewAnimationBounceCenter) {
        _topView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [UIView animateWithDuration:CXDAnimationTime delay:0.0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionTransitionNone animations:^{
            weakSelf.topView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }else if (self.popViewAnimationType == PopViewAnimationBottom) {
        self.topView.centerY = kScreenHeight + self.topView.height / 2;
        [UIView animateWithDuration:CXDAnimationTime animations:^{
            self.topView.centerY = kScreenHeight - self.topView.height / 2;
        }];
    }else {
        self.topView.centerX = kScreenWidth + self.topView.width / 2;
        [UIView animateWithDuration:CXDAnimationTime animations:^{
            self.topView.centerX = kScreenWidth - self.topView.width / 2;
        }];
    }
}

- (void)hideView {
    [self removeFromSuperview];
}

+ (void)hideView {
    [[self defaultBackgroundView] hideView];
}

- (void)removeTopView:(void (^)(void))complete {
    if (self.topView) {
        if (self.popViewAnimationType == PopViewAnimationBottom) {
            [UIView animateWithDuration:CXDAnimationTime animations:^{
                self.topView.centerY = kScreenHeight + self.topView.height / 2;
            } completion:^(BOOL finished) {
                [self.topView removeFromSuperview];
                if (complete) {
                    complete();
                }
            }];
        }else if (self.popViewAnimationType == PopViewAnimationBounceCenter) {
            [self.topView removeFromSuperview];
            if (complete) {
                complete();
            }
        }else {
            [UIView animateWithDuration:CXDAnimationTime animations:^{
                self.topView.centerX = kScreenWidth + self.topView.width / 2;
            } completion:^(BOOL finished) {
                [self.topView removeFromSuperview];
                if (complete) {
                    complete();
                }
            }];
        }
    }else {
        if (complete) {
            complete();
        }
    }
}

- (void)removeFromSuperview {
    __weak typeof(self) wekaSelf = self;
    [self removeTopView:^{
        self.isPopping = NO;
        [wekaSelf.topView.gestureRecognizers enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [wekaSelf.topView removeGestureRecognizer:obj];
        }];
        self.topView = nil;
        self.popViewAnimationType = PopViewAnimationDefault;
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [super removeFromSuperview];
    }];
}

- (void)clickBackgroundView:(UITapGestureRecognizer *)tap {
    if (self.isTouchHidden == YES) {
        [self hideView];
    }
}

+ (void)tapTopView:(UITapGestureRecognizer *)tap {
    [[UIApplication sharedApplication].delegate.window endEditing:YES];
}

+ (void)presentTopViewWith:(UIView *)view isTouchHide:(BOOL)isTouchHidden {
    [[self defaultBackgroundView] presentTopViewWith:view isTouchHide:isTouchHidden];
}

- (void)presentTopViewWith:(UIView *)view isTouchHide:(BOOL)isTouchHidden {
    [self removeTopView:^{
        self.isTouchHidden = isTouchHidden;
        self.topView = view;
        self.popViewAnimationType = PopViewAnimationBottom;
        [self popTopView];
    }];
}

+ (void)showFilterViewWith:(UIView *)view isTouchHide:(BOOL)isTouchHidden {
    [[self defaultBackgroundView] showFilterViewWith:view isTouchHide:isTouchHidden];
}

- (void)showFilterViewWith:(UIView *)view isTouchHide:(BOOL)isTouchHidden {
    [self removeTopView:^{
        self.isTouchHidden = isTouchHidden;
        self.topView = view;
        self.popViewAnimationType = PopViewAnimationDefault;
        [self popTopView];
    }];
}

//控制键盘
- (void)keyboardWasShown:(NSNotification *)keyboardShownNoti {
    NSDictionary *keyboardInfo = keyboardShownNoti.userInfo;
    NSInteger keyboardHeight = [[keyboardInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    if (keyboardHeight == 0 || keyboardHeight > 300) {
        return;
    }
    
    NSUInteger centerY = kScreenHeight - keyboardHeight - self.topView.frame.size.height / 2 + 50 - self.popHeight;
    CGPoint center = CGPointMake(kScreenWidth / 2, centerY);
    [UIView animateWithDuration:CXDAnimationTime animations:^{
        self.topView.center = center;
    }];
}

- (void)keyboardWillBeHidden:(NSNotification *)keyboardHiddenNoti {
    CGPoint center;
    if (self.popViewAnimationType == PopViewAnimationDefault) {
        center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2);
    }else {
        center = CGPointMake(kScreenWidth / 2, kScreenHeight - self.topView.height / 2);
    }
    [UIView animateWithDuration:CXDAnimationTime animations:^{
        self.topView.center = center;
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //若点击了tableViewCell，则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

@end
