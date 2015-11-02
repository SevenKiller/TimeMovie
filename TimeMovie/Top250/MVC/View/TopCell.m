//
//  TopCell.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "TopCell.h"


@implementation TopCell

-(void)setTopModel:(TopModel *)topModel
{
    _topModel = topModel;
    //填充数据
    NSString *urlString = _topModel.images[@"medium"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    _nameLabel.text = _topModel.movieName;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_topModel.rating];
    _startView.rating = _topModel.rating;
}

@end
