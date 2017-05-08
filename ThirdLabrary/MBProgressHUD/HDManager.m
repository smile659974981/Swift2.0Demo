//
//  HDManager.m
//  AXMDemo
//
//  Created by 夏婷 on 16/5/31.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "HDManager.h"
#import "MBProgressHUD.h"//加载指示器的头文件

@implementation HDManager

//获取加载指示器的方法
+(MBProgressHUD *)shareHDView
{
    static MBProgressHUD *hdView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!hdView) {
            //获取程序的主窗口
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            hdView = [[MBProgressHUD alloc]initWithWindow:window];
            hdView.labelText = @"正在加载...";
        }
    });
    return hdView;
}
//开始加载
+(void)startLoading
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hd =[self shareHDView];
    [window addSubview:hd];
    [hd show:YES];
}

//结束加载
+(void)stopLoading
{
    MBProgressHUD *hd =[self shareHDView];
    [hd hide:YES];
}


@end
