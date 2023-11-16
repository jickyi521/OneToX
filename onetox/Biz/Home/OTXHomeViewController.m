//
//  OTXHomeViewController.m
//  onetox
//
//  Created by Qian Yi on 2023/10/7.
//

#import "OTXHomeViewController.h"
#import "HomeTestViewController.h"
#import "ProProgressView.h"
#import "Flutter/FlutterEngine.h"
#import "AppDelegate.h"
#import "Flutter/FlutterViewController.h"
#import "GeneratedPluginRegistrant.h"

@interface OTXHomeViewController()

@property(strong, nonatomic) FlutterMethodChannel *batteryChannel;

@end

@implementation OTXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
//    [self layoutProgressUI];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutUI) name:@"INJECTION_BUNDLE_NOTIFICATION" object:nil];
}

- (void)layoutProgressUI{
    ProProgressView *progressView = [[ProProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    progressView.center = self.view.center;
    [self.view addSubview:progressView];
    
    [progressView setProgress:0.2];
}

- (void)layoutUI{
    UIButton *clickBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    clickBtn.backgroundColor = [UIColor redColor];
    clickBtn.center = self.view.center;
    [clickBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
    
//    UILabel *label =  [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    label.font = [UIFont systemFontOfSize:18];
//    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Clear all"]];
//    NSRange strRange = {0,[str length]};
//    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
//    label.attributedText = str;
//    label.center = self.view.center;
//    [self.view addSubview:label];
    
}

- (void)showFlutterVC {
//    FlutterEngine *flutterEngine =
//        ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    
    
    FlutterEngine *flutterEngine = [[FlutterEngine alloc] init];
    // FlutterDefaultDartEntrypoint is the same as nil, which will run main().
    [flutterEngine runWithEntrypoint:nil
                        initialRoute:@"/platform"];
        FlutterViewController *flutterViewController =
            [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    
    
    __weak __typeof(self) weakSelf = self;
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                             methodChannelWithName:@"samples.flutter.dev/battery"
                                             binaryMessenger:flutterViewController.binaryMessenger];
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
         // This method is invoked on the UI thread.
          if ([@"getBatteryLevel" isEqualToString:call.method]) {
            int batteryLevel = [weakSelf getBatteryLevel];

            if (batteryLevel == -1) {
              result([FlutterError errorWithCode:@"UNAVAILABLE"
                                         message:@"Battery level not available."
                                         details:nil]);
            } else {
              result(@(batteryLevel));
            }
          } else {
            result(FlutterMethodNotImplemented);
          }
     }];

     [GeneratedPluginRegistrant registerWithRegistry:flutterEngine];
    
    
    [self.navigationController pushViewController:flutterViewController animated:NO];
}

- (int)getBatteryLevel {
  UIDevice* device = UIDevice.currentDevice;
  device.batteryMonitoringEnabled = YES;
  if (device.batteryState == UIDeviceBatteryStateUnknown) {
    return -1;
  } else {
    return (int)(device.batteryLevel * 100);
  }
}

-(void)btnClick{
    
    [self showFlutterVC];
//    HomeTestViewController *testVc = [[HomeTestViewController alloc] init];
//    testVc.hidesBottomBarWhenPushed = NO;
//    
//    [self.navigationController pushViewController:testVc animated:NO];
    
}

-(void)injected{
    NSLog(@"I've been injected: %@", self);
    NSLog(@"这里调用修改页面布局的代码，如这里调用了viewDidLoad方法");
    #if DEBUG
        [self viewDidLoad];
        [self layoutUI];
    #endif
}

@end
