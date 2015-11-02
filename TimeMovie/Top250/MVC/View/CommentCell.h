//
//  CommentCell.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface CommentCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UIView *bgView;



@property (nonatomic, strong) Comment *comment;
@end
