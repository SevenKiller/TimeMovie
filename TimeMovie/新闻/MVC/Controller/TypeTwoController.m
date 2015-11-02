//
//  TypeTwoController.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "TypeTwoController.h"

@interface TypeTwoController ()

@end

@implementation TypeTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    self.view.backgroundColor = [UIColor yellowColor];
    
    //----------------UIWebView-------------------
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:web];
    
    /*
    //URL网络地址
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    //网络请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    //使用一个网络请求 来加载页面
    [web loadRequest:request];
    */
    
    //URL网络地址
    NSURL *url = [NSURL URLWithString:@"http://www.zhe800.com/?utm_content=T_title&jump_source=1&qd_key=XucS9iov&utm_source=baidupz"];
    //网络请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    //使用一个网络请求 来加载页面
    [web loadRequest:request];
    
    /*
    //1.读取文件
    //读取HTML文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    
    //读取文件数据
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //读取新闻数据json文件
    NSDictionary *dic = [MovieJSON readJSONFile:@"news_detail"];
    
    //2.拼接HTML字符串
    //读取页面需要使用的相关数据
    NSString *title = dic[@"title"];
    NSString *content = dic[@"content"];
    NSString *time = dic[@"time"];
    NSString *source = dic[@"source"];
    
    htmlString = [NSString stringWithFormat:htmlString,title,content,time,source];
    
    //3.加载页面
    [web loadHTMLString:htmlString baseURL:nil];
    
    //屏幕自适应
    web.scalesPageToFit = YES;
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
