//
//  AppDelegate.m
//  TimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "AppDelegate.h"
#import "launchViewController.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /**
     *  ios6.0以及以前的版本 修改状态栏颜色的方法
     *  UIApplication  应用程序
     *  获取当前运行的这个应用程序 sharedApplication
     */
    UIApplication *app = [UIApplication sharedApplication];
    //设置状态栏的颜色
    [app setStatusBarStyle:UIStatusBarStyleLightContent];
    //设置状态栏的隐藏和现实
//    [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
//    显示启动界面
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor lightGrayColor];
    [self.window makeKeyAndVisible];
    
    //判断是否是第一次运行
    //储存一些用户配置
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //通过一个Key 来获取一个值 如果没有找到此值 则返回NO
    BOOL first = [userDefaults boolForKey:@"first"];
    if (!first)
    {
        //第一次运行程序
        self.window.rootViewController = [[FirstViewController alloc] init];
    }
    else
    {
        self.window.rootViewController = [[launchViewController alloc] init];
    }

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
