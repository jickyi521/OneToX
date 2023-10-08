//
//  AppDelegate.m
//  onetox
//
//  Created by Qian Yi on 2023/10/7.
//

#import "AppDelegate.h"
#import "OTXRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 设置主窗口,并设置根控制器
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [self.window makeKeyAndVisible];
    OTXRootViewController *rootViewController = [[OTXRootViewController alloc] init];
    [self.window setRootViewController:rootViewController];
    
    return YES;
}


@end
