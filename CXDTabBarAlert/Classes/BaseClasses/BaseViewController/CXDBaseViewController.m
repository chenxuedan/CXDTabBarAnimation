//
//  CXDBaseViewController.m
//  CXDTabBarAlert
//
//  Created by chenxuedan on 2019/11/11.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "CXDBaseViewController.h"

@interface CXDBaseViewController ()

@end

@implementation CXDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 13.0, *)) {
        [UIApplication sharedApplication].delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    } else {
        // Fallback on earlier versions
    }
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
