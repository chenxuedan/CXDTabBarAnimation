//
//  ZXYDeviceController.m
//  CXDTabBarAlert
//
//  Created by chenxuedan on 2019/11/11.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "ZXYDeviceController.h"
#import "CXDAlertView.h"

@interface ZXYDeviceController ()


@end

@implementation ZXYDeviceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = RandomColor;
    
    [self.view addSubview:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 100, kScreenWidth - 40, 36);
        button.backgroundColor = [UIColor cyanColor];
        [button setTitle:@"点击跳转" forState:UIControlStateNormal];
        [button setTitleColor:CXDTitleColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
}

- (void)buttonClickAction {
    CXDAlertView *alertView = [[CXDAlertView alloc] init];
//    alertView.maskType = CXDBackMaskTypeBlurEffect;
    alertView.cornerRadius = 15;
    [alertView showWithTitle:@"提示" contentTitle:@"提示信息文" detailTitle:@"查看" cancelButton:@"取消" otherButtons:@[@"确认"] clickBlock:^(NSUInteger tag) {
        if (tag == -1) {
            NSLog(@"查看详情");
        } else if (tag == 0) {
            NSLog(@"取消");
        } else if (tag == 1) {
            NSLog(@"确认");
        }
    }];
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
