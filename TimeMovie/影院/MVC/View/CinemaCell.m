//
//  CinemaCell.m
//  TimeMovie
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "CinemaCell.h"


@implementation CinemaCell

-(void)setCinema:(cinema *)cinema
{
    _cinema = cinema;
    //取出model中存储的数据
    _cinemaLabel.text = _cinema.name;
    _addressLabel.text = _cinema.address;
    _gradeLabel.text = [NSString stringWithFormat:@"%@",_cinema.grade];
    
    if ([_cinema.lowPrice isKindOfClass:[NSNull class]] || _cinema.lowPrice.length == 0) {
        _lowPriceLabel.text = nil;
    }
    else
    {
        _lowPriceLabel.text = [NSString stringWithFormat:@"￥%@", _cinema.lowPrice ];
        
    }
    
    _coupon.hidden = [_cinema.isCouponSupport isEqualToString:@"0"];
    _seat.hidden = [_cinema.isSeatSupport isEqualToString:@"0"];
    _group.hidden = [_cinema.isGroupBuySupport isEqualToString:@"0"];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
