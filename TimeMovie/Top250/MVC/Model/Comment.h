//
//  Comment.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BaseModel.h"

@interface Comment : BaseModel

/*
 {
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "charmingoddess",
 "rating" : "10.0",
 "content" : "这是腾讯那洛克渣片吗→_→"
 }
 */


@property (nonatomic, copy) NSString *userImage;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *content;


@property (nonatomic, assign) BOOL isShow;

@end
