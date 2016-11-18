//
//  OneViewController.m
//  代码创建TabBarController
//
//  Created by imac on 16/8/15.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "OneViewController.h"
#import "ThirdViewController.h"
#import "UIViewController+WBSliderViewController.h"
#import "WBSliderViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"首页";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-75, self.view.frame.size.height/2, 150, 50)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"点击跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClickMethod) forControlEvents:UIControlEventTouchUpInside];
    
    
    //接收通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(leftSliderClickWithRow:) name:@"leftClick" object:nil];
    
    //导航栏左右按钮,点击滑出页面
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showLeftAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(showRightAction)];
}

-(void)btnClickMethod{
    
    ThirdViewController *thirdVc = [[ThirdViewController alloc]init];
    //跳转隐藏tabBar
        self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:thirdVc animated:YES];
    //返回时候显示tabBar
        self.hidesBottomBarWhenPushed = NO;
}

#pragma mark-- 弹出左控制器
- (void)showLeftAction
{
    [[self sliderViewController] showLeft];
}


#pragma mark -- 弹出右控制器
- (void)showRightAction
{
    [[self sliderViewController] showRight];
}


#pragma mark -- 左边控制器页面push方法
-(void)leftSliderClickWithRow:(NSNotification *)indexPath{
    
    ThirdViewController *thirdVc = [[ThirdViewController alloc]init];
    
    [self.navigationController pushViewController:thirdVc animated:YES];

}


#pragma mark -- 移除通知
-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


@end
