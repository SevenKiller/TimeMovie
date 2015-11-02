//
//  district.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BaseModel.h"

@interface district : BaseModel
//地区
@property (nonatomic,copy) NSString *name; //地区名
@property (nonatomic,copy) NSString *districtID;//地区ID

@property (nonatomic,copy) NSMutableArray *cinemas;//地区中所有电影院


@end
