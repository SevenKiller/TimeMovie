//
//  MovieCell.m
//  TimeMovie
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "MovieCell.h"
#import "StartView.h"

@interface MovieCell()

@property (strong, nonatomic) IBOutlet UIImageView *movieImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet StartView *startView;



@end

@implementation MovieCell


//复写setMovie
- (void)setMovie:(Movie *)movie
{
    _movie = movie;
    //取出电影model对象中存储的数据
    _titleLabel.text = _movie.titleC;
    _yearLabel.text = [NSString stringWithFormat:@"上映年份:%@",_movie.year];
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_movie.rating];
    
    //从网络读取图片
    //创建url
    NSString *urlString = _movie.images[@"small"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [_movieImageView sd_setImageWithURL:url];
    
    [_startView setRating:_movie.rating];
   // _startView.rating = _movie.rating;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
