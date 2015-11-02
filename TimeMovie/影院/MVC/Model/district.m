//
//  district.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "district.h"

@implementation district

//复写初始方法
- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    //调用父类的初始化方法，来加载属性名和key相同的数据
    self = [super initContentWithDic:jsonDic];
    if (self)
    {
        //手动加载 名字不相同的数据
        self.districtID = jsonDic[@"id"];
        self.name = jsonDic[@"name"];
        //初始化电影院数组
        _cinemas = [[NSMutableArray alloc] init];
        
    }
    
    return self;
}

@end
