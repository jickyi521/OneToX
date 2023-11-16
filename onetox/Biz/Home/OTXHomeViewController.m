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

@interface OTXHomeViewController ()


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
                        initialRoute:@"/login"];
        FlutterViewController *flutterViewController =
            [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self.navigationController pushViewController:flutterViewController animated:NO];
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
