//
//  TopModel.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "TopModel.h"

@implementation TopModel

- (id)initWithContentsOfDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        //电影名
        _movieName = dictionary[@"title"];
        //评分
        NSDictionary *ratingDic = dictionary[@"rating"];
        NSNumber *number = ratingDic[@"average"];
        _rating = [number floatValue];
        //图片
        _images = dictionary[@"images"];
        
    }
   return self;
}

+ (id)topWithContentsOfDictionary:(NSDictionary *)dictionary
{
    
    return [[TopModel alloc] initWithContentsOfDictionary:dictionary];
}

@end
