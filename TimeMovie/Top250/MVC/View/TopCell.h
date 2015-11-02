//
//  TopCell.h
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModel.h"
#import "StartView.h"

@interface TopCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;//海报
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;    //电影名
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;  //评分
@property (strong, nonatomic) IBOutlet StartView *startView;  //星星视图
@property (nonatomic,strong) TopModel *topModel;

@end
