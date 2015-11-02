//
//  PostCell.m
//  TimeMovie
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "PostCell.h"
#import "StartView.h"

@interface PostCell()



@end

@implementation PostCell

- (void)setMovie:(Movie *)movie
{
    _movie = movie;
    NSString *urlString = _movie.images[@"large"];
    NSURL *url = [NSURL URLWithString:urlString];
    [_bigImageView sd_setImageWithURL:url];
    [_litterImageView sd_setImageWithURL:url];
    _titleCLabel.text = _movie.titleC;
    _titleELabel.text = _movie.titleE;
    _yearLabel.text = _movie.year;
    _starView.rating = _movie.rating;
}

//翻转单元格
-(void)filpCell
{
    [UIView transitionWithView:self
                      duration:0.3
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        _bigImageView.hidden = !_bigImageView.hidden;
                    }completion:nil];
    
}

- (void)cancelFilp
{
    _bigImageView.hidden = NO;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
