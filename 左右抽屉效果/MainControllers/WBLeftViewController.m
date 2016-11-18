//
//  WBLeftViewController.m
//  左右抽屉效果
//
//  Created by imac on 2016/11/18.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "WBLeftViewController.h"
#import "ThirdViewController.h"
#import "WBTabBarController.h"
#import "UIViewController+WBSliderViewController.h"
#import "WBSliderViewController.h"
@interface WBLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *wbTableView;

@end

@implementation WBLeftViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.wbTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.wbTableView.delegate = self;
    self.wbTableView.dataSource =self;
    [self.view addSubview:self.wbTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *iDs = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    
    cell.textLabel.text = @"尝试点击一下";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //push页面的同时,隐藏左边控制器,回到中心页面,通知方法方法在tabBar的第一个控制器中,oneViewController
    [[self sliderViewController] hideLeft];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"leftClick" object:nil
  userInfo:nil];
    
   
}











@end
