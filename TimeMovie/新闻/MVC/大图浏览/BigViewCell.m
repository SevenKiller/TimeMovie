//
//  BigViewCell.m
//  TimeMovie
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BigViewCell.h"

@implementation BigViewCell

#pragma mark - 调用创建视图方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatViews];
    }
    return self;
}

#pragma mark - 创建视图
- (void)creatViews
{
    //创建滑动视图
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    //滑动范围
    _scrollView.contentSize = self.frame.size;
    //设置缩放倍数
    _scrollView.maximumZoomScale = 3;
    _scrollView.minimumZoomScale = 0.3;
    
    _scrollView.delegate = self;
    
    [self.contentView addSubview:_scrollView];
    
    //创建图片视图
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.image = [UIImage imageNamed:@"11"];
    [_scrollView addSubview:_imageView];
    
    //图片的拉伸模式
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //创建手势识别器 : 单击
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTapAction)];
    oneTap.numberOfTapsRequired = 1;
    oneTap.numberOfTouchesRequired = 1;
    
    //将手势识别器添加到某个视图上
    [_imageView addGestureRecognizer:oneTap];
    
    //给图片视图，开启点击事件
    _imageView.userInteractionEnabled = YES;
    
    //创建手势识别器 : 双击
    UITapGestureRecognizer *twoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoTapAction)];
    twoTap.numberOfTapsRequired = 2;
    twoTap.numberOfTouchesRequired = 1;
    
    //将手势识别器添加到某个视图上
    [_imageView addGestureRecognizer:twoTap];
}

#pragma mark - 手势点击响应事件
//单击调用方法
- (void)oneTapAction
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                              target:self
                                            selector:@selector(delayAction)
                                            userInfo:nil
                                             repeats:NO];
    
    
}
//单击之后 延迟调用方法
- (void)delayAction
{
    // 使用通知来隐藏导航栏
    // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hiddenNavigationBar" object:nil];
}

//双击调用方法
- (void)twoTapAction
{
    //取消单击 取消定时器
    [_timer invalidate];
    //判断当前的缩放状态
    if (_scrollView.zoomScale >= 2)
    {
        //已经处于放大状态下
        [_scrollView setZoomScale:1 animated:YES];
    }
    else
    {
        
        //还未处于放大状态下
        [_scrollView setZoomScale:3 animated:YES];

    }
    
}

#pragma mark - 滑动视图的代理方法 返回值为捏合手势缩放的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [_imageView sd_setImageWithURL:_imageURL];
}


-(void)backImageZoomingScale
{
    _scrollView.zoomScale = 1;
    
}



@end
