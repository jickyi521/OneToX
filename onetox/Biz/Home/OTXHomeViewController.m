//
//  OTXHomeViewController.m
//  onetox
//
//  Created by Qian Yi on 2023/10/7.
//

#import "OTXHomeViewController.h"
#import "HomeTestViewController.h"

@interface OTXHomeViewController ()

@end

@implementation OTXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutUI) name:@"INJECTION_BUNDLE_NOTIFICATION" object:nil];
}

- (void)layoutUI{
    UIButton *clickBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    clickBtn.backgroundColor = [UIColor redColor];
    clickBtn.center = self.view.center;
    [clickBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
    
}

-(void)btnClick{
    HomeTestViewController *testVc = [[HomeTestViewController alloc] init];
    testVc.hidesBottomBarWhenPushed = NO;
    
    [self.navigationController pushViewController:testVc animated:NO];
    
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
