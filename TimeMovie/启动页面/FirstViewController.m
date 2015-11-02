//
//  FirstViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    UIScrollView *_scroll;
    UIImageView *_pageView;
    UIButton *_button;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建视图
    [self creatViews];
}

#pragma mark - 创建启动页面视图
- (void)creatViews
{
    _scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //分页效果开启
    _scroll.pagingEnabled = YES;
    _scroll.contentSize = CGSizeMake(5 * kScreenWidth, 0);
    _scroll.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    _scroll.delegate = self;
    
    _scroll.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_scroll];
    
    for (int i = 0; i < 5; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        //拼接图片名
        NSString *imageName = [NSString stringWithFormat:@"guide%d",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
        [_scroll addSubview:imageView];
    }
    
    //创建页码
    _pageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - 86.5)/2, kScreenHeight - 50, 86.5, 13)];
    _pageView.image = [UIImage imageNamed:@"guideProgress1"];
    [self.view addSubview:_pageView];
    
    //进入按钮
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"Welcome" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor colorWithRed:1 green:0.5 blue:0.5 alpha:1] forState:UIControlStateNormal];
    _button.frame = CGRectMake((kScreenWidth - 200)/2, kScreenHeight - 120, 200, 40);
    _button.hidden = YES;
    
    [_button addTarget:self action:@selector(jumpToMainViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
}


#pragma mark - UIScrollViewDelegate
//滑动视图滑动的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //通过计算偏移量来计算页数
    CGFloat x = scrollView.contentOffset.x;
    NSInteger index = (x + kScreenWidth/2)/kScreenWidth;
    //根据偏移量设置图片
    NSArray *imageNames = @[@"guideProgress1",
                            @"guideProgress2",
                            @"guideProgress3",
                            @"guideProgress4",
                            @"guideProgress5"];
    UIImage *image = [UIImage imageNamed:imageNames[index]];
    _pageView.image = image;
    
    if (index == 4)
    {
        _button.hidden = NO;
    }
    else
    {
        _button.hidden = YES;
    }
}

#pragma mark - 进入按钮点击事件
- (void)jumpToMainViewController
{
    //读取故事版 获取ViewController
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    //获取故事版中 第一个ViewController
    UIViewController *vc = [story instantiateInitialViewController];
    
    //获取获取当前控制器的_view 而显示在那个窗口上
    self.view.window.rootViewController = vc;
    
    //界面显示动画
    vc.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.2 animations:^{
        vc.view.transform = CGAffineTransformIdentity;
    }];
    
    //设定程序为第一次运行
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:@YES forKey:@"first"];
    
}

#pragma mark - 状态栏显示和隐藏
- (void)viewWillAppear:(BOOL)animated
{
    //隐藏状态栏
    UIApplication *app = [UIApplication sharedApplication];
    [app setStatusBarHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    //显示状态栏
    UIApplication *app = [UIApplication sharedApplication];
    [app setStatusBarHidden:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
