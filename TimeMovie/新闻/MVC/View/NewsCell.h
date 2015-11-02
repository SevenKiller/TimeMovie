//
//  NewsCell.h
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"


@interface NewsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *newsImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UIView *typeView;

@property (nonatomic,strong) News *news;


@end
