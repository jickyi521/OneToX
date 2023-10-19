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

@end
