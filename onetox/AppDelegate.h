//
//  AppDelegate.h
//  onetox
//
//  Created by Qian Yi on 2023/10/7.
//

#import <UIKit/UIKit.h>
#import "Flutter/FlutterEngine.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) FlutterEngine *flutterEngine;

@end

