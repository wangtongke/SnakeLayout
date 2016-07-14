//
//  WTKSnakeConfig.m
//  SheXingLayout
//
//  Created by 王同科 on 16/7/11.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "WTKSnakeConfigManager.h"

@implementation WTKSnakeConfigManager
+ (instancetype)shareManager
{
    static WTKSnakeConfigManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

//默认
- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}
@end
