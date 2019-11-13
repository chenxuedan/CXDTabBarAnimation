//
//  CXDConfirmView.m
//  Schedule
//
//  Created by chenxuedan on 2018/6/11.
//  Copyright © 2018年 cxd. All rights reserved.
//

#import "CXDConfirmView.h"
#import "UIView+CXDBorder.h"
#import "CXDSelectBackView.h"

//弹出框距左右边距
#define CXDConfirmPeddingWidth 25


@interface CXDConfirmView ()

@property (nonatomic, strong)NSArray *buttonTitles;
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIView *bottomView;
@property (nonatomic, copy)NSString *cancelText;

@end

@implementation CXDConfirmView

- (instancetype)initWithTitle:(NSString *)title andContent:(NSString *)content andCancelStr:(NSString *)cancel andOtherBtn:(NSArray *)otherBtns {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.cancelText = cancel;
        self.layer.cornerRadius = 10.f;
        self.layer.masksToBounds = YES;
        UIView *lastView;//记录当前排版的上一个视图
        if (title) {
            lastView = [self createTitle:title];
        }
        if (content) {
            lastView = [self createContent:content and:lastView];
        }
        self.buttonTitles = otherBtns;
        
        if (otherBtns.count == 1) {
            lastView = [self createButton:otherBtns[0] with:lastView andTag:1];
        }else if (otherBtns.count > 1) {
            for (int i = 0; i < otherBtns.count; ++i) {
                lastView = [self createButton:otherBtns[i] with:lastView andTag:i + 1];
            }
        }
        if (cancel) {
            [self createCancelBtn:cancel and:lastView];
        }
    }
    return self;
}

- (instancetype)initWithImage:(NSString *)image andContent:(NSString *)content andCancelStr:(NSString *)cancel andOtherBtn:(NSArray *)otherBtns {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *lastView;//记录当前排版的上一个视图
        if (image) {
            lastView = [self createImage:image];
        }
        if (content) {
            lastView = [self createContent:content and:lastView];
        }
        self.buttonTitles = otherBtns;
        
        if (otherBtns.count == 1) {
            lastView = [self createButton:otherBtns[0] with:lastView andTag:1];
        }else if (otherBtns.count > 1) {
            for (int i = 0; i < otherBtns.count; ++i) {
                lastView = [self createButton:otherBtns[i] with:lastView andTag:i + 1];
            }
        }
        if (cancel) {
            [self createCancelBtn:cancel and:lastView];
        }
    }
    return self;
}

- (UIView *)createTitle:(NSString *)title {
    UIView *titleView = [[UIView alloc] init];
    [self addSubview:titleView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = CXDTitleColor;
    [titleLabel sizeToFit];

    [titleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(CXDConfirmPeddingWidth));
        make.left.equalTo(@(CXDConfirmPeddingWidth));
        make.centerX.equalTo(titleView);
    }];
    
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.mas_equalTo(0);
        make.bottom.equalTo(titleLabel.mas_bottom).offset(CXDConfirmPeddingWidth);
    }];
    self.topView = titleView;
    return titleView;
}

- (UIView *)createImage:(NSString *)image {
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [UIColor whiteColor];
    [self addSubview:titleView];
    
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    [titleView addSubview:titleImage];
    [titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(titleView);
        make.top.mas_equalTo(0);
    }];
    
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(titleImage.mas_bottom);
    }];
    self.topView = titleView;
    return titleView;
}

- (UIView *)createContent:(NSString *)content and:(UIView *)lastView {
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = content;
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.textColor = CXDTitleColor;
    [contentLabel sizeToFit];
    contentLabel.numberOfLines = 0;
    [contentView addSubview:contentLabel];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(@(CXDConfirmPeddingWidth));
        make.centerX.mas_equalTo(contentView);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(lastView ? lastView.mas_bottom : @(CXDConfirmPeddingWidth * 2));
        make.bottom.mas_equalTo(contentLabel.mas_bottom).mas_offset(CXDConfirmPeddingWidth);
    }];
    [contentView drawLineWithColor:CXDLightGrayColor locate:CXDLocateBottom andPedding:0];
    if (!self.topView) {
        self.topView = contentView;
    }
    return contentView;
}

- (void)createCancelBtn:(NSString *)cancel and:(UIView *)lastView {
    UIButton *cancelButton = [[UIButton alloc] init];
    [cancelButton setTitle:cancel forState:UIControlStateNormal];
    cancelButton.tag = 0;
    [cancelButton setBackgroundImage:[UIImage imageCreateWithColor:CXDLightGrayColor] forState:UIControlStateHighlighted];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:14.5];
    [self addSubview:cancelButton];
    if (self.buttonTitles.count == 0) {
        [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if (self.buttonTitles.count == 1) {
        [cancelButton setTitleColor:CXDTitleColor forState:UIControlStateNormal];
        [cancelButton drawLineWithColor:CXDLightGrayColor locate:CXDLocateRight andPedding:0];
    }else {
        [cancelButton setTitleColor:CXDTitleColor forState:UIControlStateNormal];
    }
    [cancelButton addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.buttonTitles.count == 1 ? lastView.mas_top : lastView.mas_bottom);
        make.right.mas_equalTo(self.buttonTitles.count == 1 ? lastView.mas_left : @0);
        make.height.mas_equalTo(@(CXDButtonHeight));
        if (self.buttonTitles.count == 1) {
            make.width.mas_equalTo(lastView);
        }
    }];
    self.bottomView = cancelButton;
}

- (UIView *)createButton:(NSString *)buttonTitle with:(UIView *)lastView andTag:(NSInteger)tag {
    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setTitle:buttonTitle forState:UIControlStateNormal];
    [confirmBtn setBackgroundImage:[UIImage imageCreateWithColor:CXDLightGrayColor] forState:UIControlStateHighlighted];
    confirmBtn.tag = tag;
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14.5];
    [confirmBtn addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:confirmBtn];
    if (self.buttonTitles.count == 1) {
        [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else {
        [confirmBtn                             drawLineWithColor:CXDLightGrayColor locate:CXDLocateBottom andPedding:0];
        [confirmBtn setTitleColor:CXDTitleColor forState:UIControlStateNormal];
    }
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(lastView ? lastView.mas_bottom : 0);
        if (self.buttonTitles.count != 1) {
            make.left.mas_equalTo(0);
        }else {
            if (self.cancelText) {
                make.width.mas_equalTo(self).dividedBy(2);
            }else {
                make.left.mas_equalTo(0);
            }
        }
        make.height.mas_equalTo(@(CXDButtonHeight));
    }];
    
    if (!self.topView) {
        self.topView = confirmBtn;
    }
    if (!self.cancelText) {
        self.bottomView = confirmBtn;
    }
    return confirmBtn;
}

- (void)show {
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bottomView.mas_bottom);
    }];
    [CXDSelectBackView exchangeTopViewWith:self isTouchHide:NO];
}

- (void)tapButton:(UIButton *)sender {
//    [CXDSelectBackView hideView];
//    if (self.block) {
//        self.block(sender.tag);
//    }
    if (_isVisible) {
        
    }else {
        [CXDSelectBackView hideView];
    }
    if (self.block) {
        self.block(sender.tag);
    }
}

+ (void)showConfirmViewWithTitle:(NSString *)title andContent:(NSString *)content andCancelStr:(NSString *)cancel andOtherBtn:(NSArray *)otherBtns {
    CXDConfirmView *confirmView = [[self alloc] initWithTitle:title andContent:content andCancelStr:cancel andOtherBtn:otherBtns];
    [confirmView show];
}

+ (void)showConfirmViewWithImage:(NSString *)image andContent:(NSString *)content andCancelStr:(NSString *)cancel andOtherBtn:(NSArray *)otherBtns {
    CXDConfirmView *confirmView = [[self alloc] initWithImage:image andContent:content andCancelStr:cancel andOtherBtn:otherBtns];
    [confirmView show];
}

@end
