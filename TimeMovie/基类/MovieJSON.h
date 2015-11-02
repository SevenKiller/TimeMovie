//
//  MovieJSON.h
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieJSON : NSObject

/**
 *  读取JSON文件
 *
 *  @param fileName 文件名
 *
 *  @return 数组/字典
 */

+ (id)readJSONFile:(NSString *)fileName;


@end
