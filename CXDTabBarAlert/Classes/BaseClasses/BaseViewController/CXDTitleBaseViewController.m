//
//  CXDTitleBaseViewController.m
//  CXDTabBarAlert
//
//  Created by chenxuedan on 2019/11/11.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "CXDTitleBaseViewController.h"

@interface CXDTitleBaseViewController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *titleButton;

@end

@implementation CXDTitleBaseViewController
- (instancetype)init {
    self = [super init];
    if (self) {
//        [self setBackTitle];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setBackTitle {
    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_back_btn"] style:UIBarButtonItemStyleDone target:self action:@selector(backToBtnAction)],[[UIBarButtonItem alloc] initWithCustomView:self.titleButton]];
    
    @weakify(self);
    [[self.titleButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self backToBtnAction];
    }];
}

- (void)setLeftTitleColor:(UIColor *)leftTitleColor {
    _leftTitleColor = leftTitleColor;
    [self.titleButton setTitleColor:leftTitleColor forState:UIControlStateNormal];
}

- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    [self.titleButton setTitle:leftTitle forState:UIControlStateNormal];
}

- (void)backToBtnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 懒加载
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];;
        _titleLabel.textColor = CXDTitleColor;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleButton.frame = CGRectMake(0, 0, 140, 40);
        [_titleButton.titleLabel sizeToFit];
        _titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_titleButton setTitleColor:CXDTitleColor forState:UIControlStateNormal];
    }
    return _titleButton;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
