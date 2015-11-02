//
//  TopModel.h
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject

@property(nonatomic, strong) NSDictionary *images;//海报
@property(nonatomic, assign) CGFloat rating;  //评分
@property(nonatomic,copy) NSString *movieName; //电影名

- (id)initWithContentsOfDictionary:(NSDictionary *)dictionary;

+ (id)topWithContentsOfDictionary:(NSDictionary *)dictionary;

@end
