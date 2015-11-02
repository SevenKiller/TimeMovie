//
//  DetailHeadView.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "DetailHeadView.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation DetailHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self loadData];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self loadData];
    
    NSArray *array = dic2[@"images"];
    
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.layer.cornerRadius = 5;
    _scrollView.layer.borderColor = [UIColor colorWithRed:0.4 green:0.3 blue:0.6 alpha:1].CGColor;
    _scrollView.layer.borderWidth = 2;
    
    CGFloat width = _scrollView.height - 10;
    for (int i = 0; i < array.count; i++) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(i * (width + 5) + 5, 5, width, width)];
        [view sd_setImageWithURL:[NSURL URLWithString:array[i]]];
        [_scrollView addSubview:view];
    }
    _scrollView.contentSize = CGSizeMake(5 + (width + 5) * 6, 0);
}

- (void)loadData
{
    //读取头视图数据
    dic2 = [MovieJSON readJSONFile:@"movie_detail"];
    NSURL *image = [NSURL URLWithString:dic2[@"image"]];
    [_image sd_setImageWithURL:image];
    _titleCn.text = dic2[@"titleCn"];
    
    NSArray *array1 = dic2[@"directors"];
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:@"导演: "];
    for (int i = 0; i < array1.count; i++) {
        [str1 appendString:[NSString stringWithFormat:@"%@",array1[i]]];
    }
    _directors.text = str1;
    
    NSArray *array2 = dic2[@"actors"];
    NSMutableString *str2 = [[NSMutableString alloc] initWithString:@"演员: "];
    for (int i = 0; i < array2.count; i++) {
        [str2 appendString:[NSString stringWithFormat:@"%@ ",array2[i]]];
    }
    _actors.text = str2;
    
    NSArray *array3 = dic2[@"type"];
    NSMutableString *str3 = [[NSMutableString alloc] initWithString:@"类型: "];
    for (int i = 0; i < array3.count; i++) {
        [str3 appendString:[NSString stringWithFormat:@"%@ ",array3[i]]];
    }
    _type.text = str3;
    
    NSDictionary *d = dic2[@"release"];
    _date.text =  [NSString stringWithFormat:@"上映日期：%@",d[@"date"]];
    
}

- (IBAction)imageButtonAction:(UIButton *)sender
{
    //播放视频 "http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"
    
    MPMoviePlayerViewController *moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"]];
    [self.navigationCollectioner pushViewController:moviePlayer animated:YES];
    
}


@end
