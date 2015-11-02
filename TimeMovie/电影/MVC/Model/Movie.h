//
//  Movie.h
//  TimeMovie
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Movie : NSObject

@property(nonatomic, copy) NSString *titleC;  //电影中文名
@property(nonatomic, copy) NSString *titleE;  //电影英文名
@property(nonatomic, assign) CGFloat rating;  //评分
@property(nonatomic, copy) NSString *year;    //上映年份
@property(nonatomic, strong) NSDictionary *images;//海报

- (id)initWithContentsOfDictionary:(NSDictionary *)dictionary;

+ (id)movieWithContentsOfDictionary:(NSDictionary *)dictionary;

@end
