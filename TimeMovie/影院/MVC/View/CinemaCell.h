//
//  CinemaCell.h
//  TimeMovie
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cinema.h"

@interface CinemaCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *cinemaLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *gradeLabel;
@property (strong, nonatomic) IBOutlet UILabel *lowPriceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *coupon;
@property (strong, nonatomic) IBOutlet UIImageView *seat;

@property (strong, nonatomic) IBOutlet UIImageView *group;


@property (nonatomic, strong) cinema *cinema;

@end
