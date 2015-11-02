//
//  BaseViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTabBarController.h"

@interface BaseViewController (){
    UILabel *_title;
    BOOL _isHidden;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏标题
    [self titleLabel];
    
    //设置背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

#pragma mark - 设置导航栏标题
-(void)titleLabel{
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    _title.textColor = [UIColor whiteColor];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.font = [UIFont boldSystemFontOfSize:26];
    
    self.navigationItem.titleView = _title;
}

//使用setTitle方法调用
-(void)setTitle:(NSString *)title
{
    // _title 是一个 @package 修饰的属性 所以不能直接修改
    // _title = title;
    // 所以需要使用父类中的setTitle方法来修改_title
    [super setTitle:title];
    _title.text = title;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
    if (_isHidden) {
        [tab setTabBarHidden:YES];
    }
    else
    {
        [tab setTabBarHidden:NO];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
    
    [tab setTabBarHidden:NO];
}

- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
{
    _isHidden = hidesBottomBarWhenPushed;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
