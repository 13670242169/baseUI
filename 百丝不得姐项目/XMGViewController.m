//
//  XMGViewController.m
//  5期-百思不得姐
//
//  Created by Apple on 2017/3/2.
//  Copyright © 2017年 xiaomage. All rights reserved.
//

#import "XMGViewController.h"
#import "XMGTabBarController.h"
@interface XMGViewController ()

@end

@implementation XMGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)btn{
    XMGTabBarController *tvc = [[XMGTabBarController alloc]init];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:tvc];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
