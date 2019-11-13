//
//  CXDMainTabBarController.m
//  CXDTabBarAlert
//
//  Created by chenxuedan on 2019/11/11.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "CXDMainTabBarController.h"
#import "CXDTabBarItem.h"
#import "ZXYDeviceController.h"
#import "ZXYHistoryController.h"
#import "ZXYMeViewController.h"
#import "CXDMainNavigationController.h"
#import "CXDIconView.h"

@interface CXDMainTabBarController () <UITabBarControllerDelegate>

@property (nonatomic, strong) NSDate *lastDate;
@property (nonatomic, strong) NSArray *iconSelectedArray;
@property (nonatomic, strong) NSArray *iconImageArray;
@property (nonatomic, strong) NSMutableArray *iconViewArray;

@end

@implementation CXDMainTabBarController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self createCustomIcons];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    _iconViewArray = [[NSMutableArray alloc] initWithCapacity:0];
//    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
//    [UITabBar appearance].translucent = NO;
    [self.tabBar setTintColor:CXDThemeColor];
//    self.tabBar.barStyle = UIBarStyleBlack;
//    self.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kScreenWidth, CXDTabBarHeight)];
//    self.tabBar.layer.shadowPath = path.CGPath;
//    self.tabBar.layer.shadowOpacity = 0.05;
//    self.tabBar.layer.shadowRadius = 3;
    self.iconImageArray = @[@"v2_home",@"v2_order",@"v2_my"];
    self.iconSelectedArray = @[@"v2_home_r",@"v2_order_r",@"v2_my_r"];
    self.viewControllers = [self setViewControllerForController];
}

- (NSArray *)setViewControllerForController {
    ZXYDeviceController *devController = [[ZXYDeviceController alloc] init];
    CXDTabBarItem *devTabBarItem = [[CXDTabBarItem alloc] initWithTitle:@"设备" image:[UIImage imageNamed:self.iconImageArray[0]] selectedImage:[UIImage imageNamed:self.iconSelectedArray[0]]];
    devTabBarItem.tag = 0;
    devController.tabBarItem = devTabBarItem;
    CXDMainNavigationController *devNavController = [[CXDMainNavigationController alloc] initWithRootViewController:devController];
    ZXYHistoryController *hisController = [[ZXYHistoryController alloc] init];
    CXDTabBarItem *hisTabBarItem = [[CXDTabBarItem alloc] initWithTitle:@"历史告警" image:[UIImage imageNamed:self.iconImageArray[1]] selectedImage:[UIImage imageNamed:self.iconSelectedArray[1]]];
    hisTabBarItem.tag = 1;
    hisController.tabBarItem = hisTabBarItem;
    CXDMainNavigationController *hisNavController = [[CXDMainNavigationController alloc] initWithRootViewController:hisController];
        
    ZXYMeViewController *meController = [[ZXYMeViewController alloc] init];
    CXDTabBarItem *meTabBarItem = [[CXDTabBarItem alloc] initWithTitle:@"个人信息" image:[UIImage imageNamed:self.iconImageArray[2]] selectedImage:[UIImage imageNamed:self.iconSelectedArray[2]]];
    meTabBarItem.tag = 2;
    meController.tabBarItem = meTabBarItem;
    CXDMainNavigationController *meNavController = [[CXDMainNavigationController alloc] initWithRootViewController:meController];
    [self addChildViewController:devNavController];
    [self addChildViewController:hisNavController];
    [self addChildViewController:meNavController];
    return @[devNavController, hisNavController, meNavController];
}

- (void)createCustomIcons {
    NSArray *items = self.tabBar.items;
    CGFloat width = kScreenWidth / items.count;
    for (int index = 0; index < items.count; index++) {
        CXDTabBarItem *item = items[index];
        CXDIconView *iconView = [[CXDIconView alloc] init];
        iconView.frame = CGRectMake(width * index, 0, width, CXDTabBarHeight);
        iconView.titleLabel.text = item.title;
        iconView.iconView.image = item.image;
        [self.tabBar addSubview:iconView];
        [self.iconViewArray addObject:iconView];
        item.image = nil;
        item.title = nil;
        if (index == 0) {
            self.selectedIndex = 0;
            [self selectItemIndex:0];
        }
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [self setSelectIndexFrom:self.selectedIndex to:item.tag];
}

- (void)selectItemIndex:(NSInteger)index {
    CXDIconView *iconView = self.iconViewArray[index];
    iconView.iconView.image = [[UIImage imageNamed:self.iconSelectedArray[index]] imageModificationWithColor:self.tabBar.tintColor];
    iconView.titleLabel.textColor = self.tabBar.tintColor;
}

- (void)setSelectIndexFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
    CXDIconView *iconViewFrom = self.iconViewArray[from];
    iconViewFrom.iconView.image = [UIImage imageNamed:self.iconImageArray[from]];
    iconViewFrom.titleLabel.textColor = [UIColor lightGrayColor];
    
    CXDIconView *iconView = self.iconViewArray[to];
    iconView.iconView.image = [[UIImage imageNamed:self.iconSelectedArray[to]] imageModificationWithColor:self.tabBar.tintColor];
    iconView.titleLabel.textColor = self.tabBar.tintColor;
    [iconView playBounceAnimation];
}

#pragma mark - public Methods
- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers {
    self = [super init];
    if (self) {
        self.viewControllers = viewControllers;
    }
    return self;
}

+ (instancetype)tabBarControllerWithViewControllers:(NSArray<UIViewController *> *)viewControllers {
    CXDMainTabBarController *tabBarController = [[CXDMainTabBarController alloc] initWithViewControllers:viewControllers];
    return tabBarController;
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([self doubleClick]) {
        CXDMainNavigationController *navigation = (CXDMainNavigationController *)viewController;
        if ([navigation.topViewController respondsToSelector:@selector(tabBarDoubleClick)]) {
            [navigation.topViewController performSelector:@selector(tabBarDoubleClick)];
        }
    }
}

//判断是否是双击(因为系统并没有提供双击的方法，可以通过点击的时间间隔来判断)
- (BOOL)doubleClick {
    NSDate *date = [NSDate date];
    if (date.timeIntervalSince1970 - self.lastDate.timeIntervalSince1970 < 0.5) {
        //完成一次双击后，重置第一次单击的时间，区分3次或多次的单击
        self.lastDate = [NSDate dateWithTimeIntervalSince1970:0];
        return YES;
    }
    self.lastDate = date;
    return NO;
}

@end
