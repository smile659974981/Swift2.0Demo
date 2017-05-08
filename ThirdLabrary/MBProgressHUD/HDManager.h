//
//  HDManager.h
//  AXMDemo
//
//  Created by 夏婷 on 16/5/31.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDManager : NSObject

//开始加载数据，让加载指示器显示到窗口上
+(void)startLoading;

//数据加载完毕，让加载指示器隐藏
+(void)stopLoading;


@end
