//
//  launchViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/31.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "launchViewController.h"

@interface launchViewController ()

@end

@implementation launchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用定时器 来显示图片
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:self
                                   selector:@selector(showImageView:)
                                   userInfo:nil
                                    repeats:YES];
    
}

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

#pragma mark - 定时器方法 显示图片
- (void)showImageView:(NSTimer *)timer
{
    static NSInteger i = 1;
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:i];
    //显示这个ImageView
    imageView.hidden = NO;
    i++;
    if (i == 25) {
        [timer invalidate];
        
        //延迟0.5秒 跳到主界面
        [self performSelector:@selector(jumpToMainViewController)
                   withObject:self
                   afterDelay:0.5];
    }
}

#pragma mark - 跳转到主界面
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
