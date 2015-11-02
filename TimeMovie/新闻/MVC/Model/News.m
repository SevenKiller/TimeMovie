//
//  News.m
//  TimeMovie
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "News.h"

@implementation News

-(NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic
{
    /*
     属性名与json字典中key的映射关系
     key:  json字典的key名
     value: model对象的属性名
     */
     NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
    //添加 key 和model 中属性名的映射关系
    [mapDic setObject:@"newsID" forKey:@"id"];
    
    return mapDic;
}



@end
