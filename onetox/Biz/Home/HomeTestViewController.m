//
//  HomeTestViewController.m
//  onetox
//
//  Created by Qian Yi on 2023/10/19.
//

#import "HomeTestViewController.h"

@interface HomeTestViewController ()

@end

@implementation HomeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = NO;
    [self layoutUI];
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.hidden = YES;
    self.hidesBottomBarWhenPushed = NO;
}


- (void)layoutUI{
    
    UIButton *clickBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    clickBtn.backgroundColor = [UIColor greenColor];
    clickBtn.center = self.view.center;
    [clickBtn setTitle:@"second" forState:UIControlStateNormal];
    [clickBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
    
}

- (void)btnClick{
    NSLog(@"btnClick");
    self.navigationController.tabBarController.tabBar.hidden = YES;
}

@end
