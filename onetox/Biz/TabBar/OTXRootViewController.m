//
//  OTXRootViewController.m
//  onetox
//
//  Created by Qian Yi on 2023/10/7.
//

#import "OTXRootViewController.h"
#import "MainTabBarViewController.h"

@interface OTXRootViewController ()

@end

@implementation OTXRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNewTabBar];
}

- (CYLTabBarController *)createNewTabBar {
//    [CYLPlusButtonSubclass registerPlusButton];
    return [self createNewTabBarWithContext:nil];
}

- (CYLTabBarController *)createNewTabBarWithContext:(NSString *)context {
    MainTabBarViewController *tabBarController = [[MainTabBarViewController alloc] initWithContext:context];
    self.viewControllers = @[tabBarController];
    return tabBarController;
}

@end
