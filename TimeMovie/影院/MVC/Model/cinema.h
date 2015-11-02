//
//  cinema.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BaseModel.h"

@interface cinema : BaseModel

/*
 "lowPrice" : "40.00",
 "grade" : "8.8",
 "coord" : "116.36047,40.01433",
 "distance" : null,
 "address" : "北京市海淀区学清路甲8号，圣熙8号购物中心五层西侧。",
 "name" : "嘉华国际影城",
 "id" : "1396",
 "msg" : null,
 "districtId" : "1015",
 "tel" : "010-82732228",
 "isSeatSupport" : "1",
 "isCouponSupport" : "1",
 "isImaxSupport" : "0",
 "isGroupBuySupport" : "0",
 "circleName" : "五道口"
 */


@property (nonatomic,copy) NSString *lowPrice; //票价
@property (nonatomic,copy) NSString *grade;  //评价
@property (nonatomic,copy) NSString *address;//地址
@property (nonatomic,copy) NSString *name; //影院名
@property (nonatomic,copy) NSString *districtId; //地区ID
@property (nonatomic,copy) NSString *isSeatSupport; //是否支持选座
@property (nonatomic,copy) NSString *isCouponSupport;//是否支持券
@property (nonatomic,copy) NSString *isImaxSupport;//是否IMAX
@property (nonatomic,copy) NSString *isGroupBuySupport;//是否团购

@end
