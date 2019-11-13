//
//  CXDMainNavigationController.m
//  CXDTabBarAlert
//
//  Created by chenxuedan on 2019/11/11.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "CXDMainNavigationController.h"

@interface CXDMainNavigationController ()

@property (nonatomic, weak, readwrite) UIImageView *navSystemLine;

@end

@implementation CXDMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBaseSetting];
}

- (void)initBaseSetting {
    //设置导航条上标题的颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:CXDTitleColor,NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    [self.navigationBar setTintColor:CXDTitleColor];
    //设置背景色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UINavigationBar appearance].translucent = NO;
    if (@available(iOS 13.0, *)) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    } else {
        // Fallback on earlier versions
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    //取消底部横线
    [self.navigationBar setShadowImage:[UIImage new]];
    [self hideNavigationSystemLine];
    
    self.navigationBar.layer.shadowColor = [UIColor blackColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kScreenWidth, 44)];
    self.navigationBar.layer.shadowPath = path.CGPath;
    self.navigationBar.layer.shadowOpacity = 0.05;
    self.navigationBar.layer.shadowRadius = 10;
}

#pragma mark - Public Method
///显示导航栏的细线
- (void)showNavigationSystemLine {
    self.navSystemLine.hidden = NO;
}
///隐藏导航栏的细线
- (void)hideNavigationSystemLine {
//    self.navSystemLine.hidden = YES;
    
    //隐藏系统的导航栏分割线
    UIImageView *navigationBarBottomLine = [self fineHairlineImageViewUnder:self.navigationBar];
    navigationBarBottomLine.hidden = YES;
}

- (UIImageView *)fineHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subView in view.subviews) {
        UIImageView *imageView = [self fineHairlineImageViewUnder:subView];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark - 设置导航栏的分割线
- (void)setupNavigationBarBottomLine {
    //隐藏系统的导航栏分割线
    UIImageView *navigationBarBottomLine = [self fineHairlineImageViewUnder:self.navigationBar];
    navigationBarBottomLine.hidden = YES;
    
    //添加自己的分割线
//    CGFloat navSystemLineH = .5f;
//    UIImageView *navSystemLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.navigationBar.height - navSystemLineH, kScreenWidth, navSystemLineH)];
//    navSystemLine.backgroundColor = RandomColor;
//    [self.navigationBar addSubview:navSystemLine];
//    self.navSystemLine = navSystemLine;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navigation_back_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backToBtnAction)];
    }
//    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:0 target:nil action:nil];
    // 解决ios7自带的手滑手势引发的崩溃
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backToBtnAction {
    [self popViewControllerAnimated:YES];
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
