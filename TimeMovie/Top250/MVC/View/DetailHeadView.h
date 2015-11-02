//
//  DetailHeadView.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHeadView : UIView
{
    NSDictionary *dic2;
}

@property (strong, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UILabel *titleCn;

@property (strong, nonatomic) IBOutlet UILabel *directors;

@property (strong, nonatomic) IBOutlet UILabel *actors;

@property (strong, nonatomic) IBOutlet UILabel *type;

@property (strong, nonatomic) IBOutlet UILabel *date;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) UINavigationController *navigationCollectioner;

@end
