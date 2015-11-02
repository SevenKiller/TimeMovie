//
//  BaseTabBarController.m
//  TimeMovie
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BaseTabBarController.h"
#import "TabBarButton.h"


@interface BaseTabBarController ()
{
    UIView *_newTabBar;  //一个自定义的标签栏
    UIImageView *_selectedImageView; //选中标签
}

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //自定义创建TabBar
    [self creatTabBar];
}

#pragma mark - 自定义创建TabBar
-(void)creatTabBar
{
    //隐藏系统自带的标签栏
    self.tabBar.hidden = YES;
    
    //创建自定义标签栏
    _newTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
    _newTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg_all"]];
    [self.view addSubview:_newTabBar];
    
    //self.viewControllers.count:标签控制器下管理的视图控制器
    CGFloat buttonWidth = kScreenWidth / self.viewControllers.count;
    
   #pragma mark - 创建选中图片视图
    _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 49)];
    
    _selectedImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1@2x"];
    [_newTabBar addSubview:_selectedImageView];
    
    //创建按钮
    //1.计算按钮的宽
    NSArray *titles = @[@"电影",
                        @"新闻",
                        @"Top",
                        @"影院",
                        @"更多"];
    NSArray *imageNames = @[@"movie_home",
                            @"msg_new",
                            @"start_top250",
                            @"icon_cinema",
                            @"more_setting"];
    
    
    for (int i = 0; i < self.viewControllers.count; i++)
    {
        
        TabBarButton *button = [[TabBarButton alloc] initWithTitle:titles[i]image:imageNames[i] frame:CGRectMake(i * buttonWidth, 0, buttonWidth, 49)];

        //设置tag值
        button.tag = i + 100;
        
        //添加点击事件
        [button addTarget:self
                   action:@selector(buttonAction:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [_newTabBar addSubview:button];
    }
    
    
}

#pragma mark - 按钮点击响应事件
-(void)buttonAction:(UIButton *)button
{
    NSInteger index = button.tag - 100;
    //切换到对应的子控制器
    self.selectedIndex = index;
    
    //滑动图片选中视图
    CGRect frame = _selectedImageView.frame;
    
    frame = CGRectMake(index * button.frame.size.width, 0, button.frame.size.width, 49);
    
    [UIView animateWithDuration:0.3 animations:^{
        _selectedImageView.frame = frame;
        
    }];
    
}

- (void)setTabBarHidden:(BOOL)isHidden
{
    
    _newTabBar.hidden = isHidden;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
