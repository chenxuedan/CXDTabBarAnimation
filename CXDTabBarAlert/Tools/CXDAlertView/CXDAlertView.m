//
//  CXDAlertView.m
//  CXDAlertView
//
//  Created by chenxuedan on 2019/10/30.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "CXDAlertView.h"
#import "CXDControlFactory.h"

@interface CXDAlertView ()

@property (nonatomic, strong) UIVisualEffectView *blurEffView;
@property (nonatomic, strong) UIView *whiteBackView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIButton *detailButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *tipView;


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *contentTitle;
@property (nonatomic, copy) NSString *detailTitle;
@property (nonatomic, copy) NSString *cancelTitle;
@property (nonatomic, copy) ButtonClickBlock clickBlock;
@property (nonatomic, strong) NSArray *otherButtons;

@end

@implementation CXDAlertView
- (void)showWithTitle:(NSString *)title
         contentTitle:(NSString *)contentTitle
          detailTitle:(NSString *)detailTitle
         cancelButton:(NSString *)cancelTitle
         otherButtons:(NSArray *)otherButtons
           clickBlock:(ButtonClickBlock)clickBlock {
    self.title = title;
    self.contentTitle = contentTitle;
    self.detailTitle = detailTitle;
    self.cancelTitle = cancelTitle;
    self.otherButtons = otherButtons;
    self.clickBlock = clickBlock;
    [self buildUI];
}

- (void)dismiss {
    
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.maskType = CXDBackMaskTypeBlack;
    self.cornerRadius = 6.0f;
    self.detailTitleColor = CXDThemeColor;
}

- (void)buildUI {
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor clearColor];
    self.blackOverlay.frame = [UIScreen mainScreen].bounds;
    [self addSubview:self.blackOverlay];
    
    self.titleLabel.text = self.title;
    self.contentLabel.text = self.contentTitle;
    [self.detailButton setTitle:self.detailTitle forState:UIControlStateNormal];
    [self setUpMaskType];
    [self createSubUI];
    [self initLabelTitle];
    [self show];
}

- (void)createSubUI {
    [self addSubview:self.whiteBackView];
    self.whiteBackView.layer.cornerRadius = self.cornerRadius;
    [self.whiteBackView addSubview:self.titleLabel];
    [self.whiteBackView addSubview:self.contentLabel];
    [self.whiteBackView addSubview:self.detailButton];
    [self.whiteBackView addSubview:self.lineView];
    [self.whiteBackView addSubview:self.cancelButton];
    [self layoutSubViewContraints];
    self.cancelButton.tag = 0;
    [self.cancelButton setTitle:self.cancelTitle forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:CXDDetailColor forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    if (self.otherButtons.count == 0) {
        __weak typeof(self) weakSelf = self;
        [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
            make.right.mas_equalTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDSpace);
            make.top.mas_equalTo(weakSelf.lineView.mas_bottom);
            make.height.mas_equalTo(CXDButtonHeight);
            make.bottom.mas_equalTo(weakSelf.whiteBackView.mas_bottom);
        }];
    } else if (self.otherButtons.count == 1) {
        __weak typeof(self) weakSelf = self;
        CGFloat btnWidth = (kScreenWidth - 4 * CXDSpace - 4 * CXDPadding) / 2;
        [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
            make.top.mas_equalTo(weakSelf.lineView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(btnWidth, CXDButtonHeight));
            make.bottom.mas_equalTo(weakSelf.whiteBackView.mas_bottom);
        }];
        [self.whiteBackView addSubview:self.tipView];
        [self.tipView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(weakSelf.whiteBackView.mas_centerX);
            make.centerY.mas_equalTo(weakSelf.cancelButton.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(1, CXDButtonHeight - 8));
        }];
        UIButton *confirmButton = [CXDControlFactory createButtonWithFrame:CGRectZero title:self.otherButtons.firstObject font:CXDTitleFont titleColor:CXDTitleColor];
        [confirmButton setTitleColor:CXDDetailColor forState:UIControlStateNormal];
        [self.whiteBackView addSubview:confirmButton];
        [confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.tipView.mas_right).mas_offset(CXDSpace);
            make.size.mas_equalTo(CGSizeMake(btnWidth, CXDButtonHeight));
            make.top.mas_equalTo(weakSelf.cancelButton.mas_top);
            make.height.mas_equalTo(CXDButtonHeight);
        }];
        confirmButton.tag = 1;
        [confirmButton addTarget:self action:@selector(cancelButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    } else {
        UIView *lastLineView = self.lineView;
        for (int i = 0; i < self.otherButtons.count; i++) {
            UIButton *button = [CXDControlFactory createButtonWithFrame:CGRectZero title:self.otherButtons[i] font:CXDTitleFont titleColor:CXDCCCGrayColor];
            [self.whiteBackView addSubview:button];
            button.tag = i + 1;
            [button addTarget:self action:@selector(cancelButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            __weak typeof(self) weakSelf = self;
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
                make.right.mas_equalTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDSpace);
                make.top.mas_equalTo(lastLineView.mas_bottom);
                make.height.mas_equalTo(CXDButtonHeight);
            }];
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
            lineView.backgroundColor = CXDGrayLineColor;
            [self.whiteBackView addSubview:lineView];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
                make.right.mas_equalTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDSpace);
                make.top.mas_equalTo(button.mas_bottom);
                make.height.mas_equalTo(0.6);
            }];
            lastLineView = lineView;
        }
        __weak typeof(self) weakSelf = self;
        [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
            make.right.mas_equalTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDSpace);
            make.top.mas_equalTo(lastLineView.mas_bottom);
            make.height.mas_equalTo(CXDButtonHeight);
            make.bottom.mas_equalTo(weakSelf.whiteBackView.mas_bottom);
        }];
    }
}

- (void)show {
    self.whiteBackView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    @weakify(self);
    [UIView animateWithDuration:0.45 delay:0.0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        @strongify(self);
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.whiteBackView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)initLabelTitle {
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.detailTitle attributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleSingle],NSUnderlineColorAttributeName:self.detailTitleColor,NSForegroundColorAttributeName:self.detailTitleColor}];
    [self.detailButton setAttributedTitle:attrString forState:UIControlStateNormal];
}

#pragma mark - Event Action
- (void)cancelButtonClickAction:(UIButton *)sender {
    self.clickBlock(sender.tag);
    if (!self.cancelDismiss) {
        [self removeFromSuperview];
    }
}

- (void)detailButtonClickAction {
    self.clickBlock(-1);
}

- (void)layoutSubViewContraints {
    __weak typeof(self) weakSelf = self;
    [self.whiteBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(CXDPadding * 2);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(-CXDPadding * 2);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
        make.right.mas_equalTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDSpace);
        make.top.mas_equalTo(weakSelf.whiteBackView.mas_top).mas_offset(CXDPadding);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDPadding);
        make.right.mas_equalTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDPadding);
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).mas_offset(CXDSpace);
    }];
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.whiteBackView.mas_centerX);
        make.top.mas_equalTo(weakSelf.contentLabel.mas_bottom).mas_offset(CXDSpace);
        make.left.mas_greaterThanOrEqualTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
        make.right.mas_lessThanOrEqualTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDSpace);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.whiteBackView.mas_left).mas_offset(CXDSpace);
        make.right.mas_equalTo(weakSelf.whiteBackView.mas_right).mas_offset(-CXDSpace);
        make.top.mas_equalTo(weakSelf.detailButton.mas_bottom).mas_offset(CXDSpace);
        make.height.mas_equalTo(0.6);
    }];
}

- (void)setUpMaskType {
    switch (self.maskType) {
        case CXDBackMaskTypeBlack:
        {
            self.blackOverlay.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
            if (self.blurEffView) {
                [self.blurEffView removeFromSuperview];
            }
        }
            break;
        case CXDBackMaskTypeBlurEffect:
        {
            self.blurEffView.frame = self.frame;
            [self addSubview:self.blurEffView];
        }
            break;
        default:
            break;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.whiteBackView.layer.cornerRadius = _cornerRadius;
}

#pragma mark - 懒加载
- (UIControl *)blackOverlay {
    if (!_blackOverlay) {
        _blackOverlay = [[UIControl alloc] initWithFrame:CGRectZero];
        [_blackOverlay addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _blackOverlay;
}

- (UIVisualEffectView *)blurEffView {
    if (!_blurEffView) {
        UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _blurEffView = [[UIVisualEffectView alloc] initWithEffect:effect];
        _blurEffView.alpha = 0.7;
    }
    return _blurEffView;
}

- (UIView *)whiteBackView {
    if (!_whiteBackView) {
        _whiteBackView = [[UIView alloc] initWithFrame:CGRectZero];
        _whiteBackView.backgroundColor = [UIColor whiteColor];
    }
    return _whiteBackView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [CXDControlFactory creteTitleLabelWithFrame:CGRectZero title:@""];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [CXDControlFactory createContentLabelWithFrame:CGRectZero title:@""];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [CXDControlFactory createDetailLabelWithFrame:CGRectZero title:@""];
        _detailLabel.numberOfLines = 0;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}

- (UIButton *)detailButton {
    if (!_detailButton) {
        _detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _detailButton.titleLabel.font = CXDDetailFont;
        [_detailButton setTitleColor:CXDDetailColor forState:UIControlStateNormal];
        _detailButton.tag = -1;
        [_detailButton addTarget:self action:@selector(detailButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailButton;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [CXDControlFactory createButtonWithFrame:CGRectZero title:@"" font:CXDTitleFont titleColor:CXDTitleColor];
    }
    return _cancelButton;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
        _lineView.backgroundColor = CXDGrayLineColor;
    }
    return _lineView;
}

- (UIView *)tipView {
    if (!_tipView) {
        _tipView = [[UIView alloc] initWithFrame:CGRectZero];
        _tipView.backgroundColor = CXDGrayLineColor;
    }
    return _tipView;
}

@end
