//
//  CommentCell.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

-(void)awakeFromNib
{
    
    _bgView.layer.cornerRadius = 3;
    _bgView.layer.borderColor = [UIColor purpleColor].CGColor;
    _bgView.layer.borderWidth = 2;
    _bgView.layer.masksToBounds = YES;
    
}

-(void)setComment:(Comment *)comment
{
    _comment = comment;
    _name.text = _comment.nickname;
    _commentLabel.text = _comment.content;
    _rating.text = _comment.rating;
    
    NSURL *url = [NSURL URLWithString:_comment.userImage];
    [_userView sd_setImageWithURL:url];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}


@end
