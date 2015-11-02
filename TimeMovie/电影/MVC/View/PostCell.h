//
//  PostCell.h
//  TimeMovie
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "StartView.h"

@interface PostCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UIImageView *litterImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleCLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleELabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet StartView *starView;



@property (nonatomic,strong)Movie *movie;

/**
 *  翻转单元格
 */
- (void)filpCell;


/**
 *  取消翻转
 */

- (void)cancelFilp;

@end
