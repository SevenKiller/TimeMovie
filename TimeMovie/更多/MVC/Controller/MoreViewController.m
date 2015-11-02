//
//  MoreViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
{
    
    UILabel *_title;
}

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self titleLabel];
    
    //将计算完成的结果 显示到界面上去
    _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB",[self countCacheFileSize]];
    
    [self countCacheFileSize];
    
}

#pragma mark - 设置导航栏标题
-(void)titleLabel{
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    _title.textColor = [UIColor whiteColor];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.font = [UIFont boldSystemFontOfSize:26];
    _title.text = @"更多";
    self.navigationItem.titleView = _title;
}


#pragma mark - 将计算的结果 显示到界面上去
- (void)viewWillAppear:(BOOL)animated
{
    _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB",[self countCacheFileSize]];
    
}

#pragma mark - 计算文件的缓存

/**
 *  计算当前应用程序缓存文件的大小之和
 *
 *  @return 文件大小
 */
- (CGFloat)countCacheFileSize
{
    //1.获取缓存文件夹的路径
    // 函数，用于获取当前程序的沙盒路径
    NSString *homePath = NSHomeDirectory();
//    NSLog(@"%@",homePath);
    
    /**
       1) 子文件夹1 视频缓存 /tmp/MediaCache/
       2) 子文件夹2 SDWebImage框架的缓存图片 /Library/Caches/com.hackemist.SDWebImageCache.default/
       3) 子文件夹3 /Library/Caches/com.jiliang.TimeMovie/
     */
   //2.使用- (CGFloat)getFileSize:(NSString *)filePath来计算这些文件夹中文件大小
    NSArray *pathArray = @[@"/tmp/MediaCache/",
                           @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
                           @"/Library/Caches/com.jiliang.TimeMovie/"];
    //文件大小之和
    CGFloat fileSize = 0;
    for (NSString *str in pathArray) {
        //拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@",homePath,str];
        fileSize += [self getFileSize:filePath];
    }
    //对上一步计算的结果进行求和 并返回
    return fileSize;
}



/**
 *  根据传入的路径 计算此路径下的文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 此文件夹下所有文件的总大小 单位MB
 */
- (CGFloat)getFileSize:(NSString *)filePath
{
    //文件管理器对象 单例
    NSFileManager *manager = [NSFileManager defaultManager];
    //数组 存储文件夹中所有的子文件夹以及文件的名字
    NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
    long long size = 0;
    
    //遍历文件夹
    for (NSString *fileName in fileNames) {
        //拼接获取文件的路径
        NSString *subFilePath = [NSString stringWithFormat:@"%@%@",filePath,fileName];
        //获取文件信息
        NSDictionary *dic = [manager attributesOfItemAtPath:subFilePath error:nil];
        //获取单个文件的大小
        NSNumber *sizeNumber = dic[NSFileSize];
        //使用一个 long long 类型来存储文件大小
        long long subFileSize = [sizeNumber longLongValue];
        
        //文件大小求和
        size += subFileSize;
        
    }
    
    return size / 1024.0 / 1024;
}


#pragma mark - 清理文件缓存
- (void)clearCacheFile
{
    //获取文件的路径
    //1.获取缓存文件夹的路径
    NSString *homePath = NSHomeDirectory();
    
    //2.删除文件
    NSArray *pathArray = @[@"/tmp/MediaCache/",
                           @"/Library/Caches/com.hackemist.SDWebImageCache.default/",
                           @"/Library/Caches/com.jiliang.TimeMovie/"];

    for (NSString *str in pathArray) {
        //拼接路径
        NSString *filePath = [NSString stringWithFormat:@"%@%@",homePath,str];
        //文件管理
        NSFileManager *manager = [NSFileManager defaultManager];
        //数组 存储文件夹中所有的子文件夹以及文件的名字
        NSArray *fileNames = [manager subpathsOfDirectoryAtPath:filePath error:nil];
        
        //遍历文件夹 删除文件
        for (NSString *fileName in fileNames) {
            //拼接子文件的路径
            NSString *subFilePath = [NSString stringWithFormat:@"%@%@",filePath,fileName];
            //删除这些文件
            [manager removeItemAtPath:subFilePath error:nil];
        }
        
    }
    //重新计算缓存文件大小
    //将计算完成的结果 显示到界面上去
    _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB",[self countCacheFileSize]];
}

#pragma mark - UITableViewDelegate
//单元格选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        //弹出一个提示框
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"是否清理缓存" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        [alert show];
    }
    
}

//不用签订协议 可以直接使用
#pragma mark - 提示框UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //判断 点击的按钮为“是”
    if (buttonIndex == 1) {
        //清理缓存
        [self clearCacheFile];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
