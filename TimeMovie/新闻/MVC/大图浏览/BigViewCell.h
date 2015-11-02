//
//  BigViewCell.h
//  TimeMovie
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigViewController.h"

@interface BigViewCell : UICollectionViewCell<UIScrollViewDelegate>
{
    UIScrollView *_scrollView; //底层的滑动视图
    UIImageView *_imageView;   //图片视图
    NSTimer *_timer;  //定时器
}

@property (nonatomic,strong) NSURL *imageURL;//单元格中，imageView显示的图片

-(void)backImageZoomingScale;

@end
