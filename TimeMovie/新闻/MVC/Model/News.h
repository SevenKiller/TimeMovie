//
//  News.h
//  TimeMovie
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface News : BaseModel

@property (nonatomic,strong) NSNumber *newsID;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *summary;  //新闻简介
@property (nonatomic,copy) NSString *image;
@property (nonatomic,assign) NSNumber *type;  //新闻的类型




@end
