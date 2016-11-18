//
//  UIViewController+WBSliderViewController.m
//  WBSliderViewController
//
//  Created by WB on 16/11/14.
//  Copyright © 2016年 WB. All rights reserved.
//

#import "UIViewController+WBSliderViewController.h"
#import "WBSliderViewController.h"

@implementation UIViewController (WBSliderViewController)

- (WBSliderViewController *)sliderViewController
{
    UIViewController *viewcontroller = (UIViewController *)self.parentViewController;
    while (viewcontroller) {
        if ([viewcontroller isKindOfClass:[WBSliderViewController class]]) {
            return (WBSliderViewController *)viewcontroller;
        }else if (viewcontroller.parentViewController && viewcontroller.parentViewController!=viewcontroller){
            viewcontroller = (UIViewController *)viewcontroller.parentViewController;
        }else{
            return nil;
        }
    }
    return nil;
}

@end
