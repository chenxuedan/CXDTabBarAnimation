//
//  CXDIconView.m
//  CXDTabBarAlert
//
//  Created by xiao zude on 2019/11/12.
//  Copyright © 2019 zxycloud. All rights reserved.
//

#import "CXDIconView.h"

@implementation CXDIconView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)playBounceAnimation {
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@1.0 , @0.6, @1.0];
    bounceAnimation.duration = 0.15;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

- (void)playImageBounceAnimation {
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@1.0 ,@1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
    bounceAnimation.duration = 0.3;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [self.iconView.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

- (void)setUpUI {
    [self addSubview:self.iconView];
    [self addSubview:self.titleLabel];
    [self layoutSubviewsContraints];
}

- (void)layoutSubviewsContraints {
    __weak typeof(self) weakSelf = self;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(6);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.top.mas_equalTo(weakSelf.iconView.mas_bottom).mas_offset(2);
    }];
}

#pragma mark - Lazy Loading
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
