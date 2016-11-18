//
//  WBSliderViewController.h
//  WBSliderViewController
//
//  Created by WB on 16/11/9.
//  Copyright © 2016年 WB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBSliderViewController : UIViewController

@property (nonatomic, strong, readonly) UIViewController *mainViewController;
@property (nonatomic, strong, readonly) UIViewController *leftViewController;
@property (nonatomic, strong, readonly) UIViewController *rightViewController;

@property (nonatomic, strong, readonly) UINavigationController *sliderNavigationController; // push所需要的navigationController 只能由mainVC 提供

/**
 初始化侧滑菜单控制器

 @param mainVC  默认显示的界面，不可为空
 @param leftVC  左边界面
 @param rightVC 右边界面

 @return 带侧滑菜单的控制器
 */
- (instancetype)initWithMainViewController:(UIViewController *)mainVC
                        leftViewController:(UIViewController *)leftVC
                       rightViewController:(UIViewController *)rightVC;

- (void)showLeft;

- (void)hideLeft;

- (void)showRight;

- (void)hideRight;

@end
