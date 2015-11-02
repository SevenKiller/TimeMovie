//
//  NewsViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "NewsViewController.h"
#import "News.h"
#import "NewsCell.h"
#import "TypeOneController.h"
#import "TypeTwoController.h"

@interface NewsViewController ()
{
    NSMutableArray *_newsData;
    //头视图
    UIImageView *_headView;
    
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新闻";
    //数据载入
    [self loadData];
    
}

#pragma mark - 数据载入
- (void)loadData
{
    
    NSArray *array = [MovieJSON readJSONFile:@"news_list"];
    _newsData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        News *news = [[News alloc] initContentWithDic:dic];
        [_newsData addObject:news];
    }
    
}

#pragma mark - UITableViewDataSource
//返回单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _newsData.count;
}

//返回单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
     News *news = _newsData[indexPath.row];
    
    //第一个单元格，头视图
    if (indexPath.row == 0)
    {
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeadNewsCell"];
        _headView = (UIImageView *)[cell.contentView viewWithTag:100];
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:101];
       
        label.text = news.title;
        [_headView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        
        return cell;
    }
    else
    {
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsListCell"];
        cell.titleLabel.text = news.title;
        [cell.newsImageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        cell.summaryLabel.text = news.summary;
        
        NSNumber *number = news.type;
        if ([number intValue] == 1)
        {
            [cell.typeView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"sctpxw"]]];
        }
        else if ([number intValue] == 2)
        {
            [cell.typeView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"scspxw"]]];
        }else
        {
            cell.typeView.backgroundColor = [UIColor whiteColor];

        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
}

#pragma mark - UITableViewDelegate
//单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 150;
    }
    else
    {
        return 60;
    }
    
}

//下拉视图，头视图放大效果:滑动视图协议方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取滑动视图y方向的偏移量
    CGFloat y = scrollView.contentOffset.y+64;

    if (y < 0) {
        
        //图片的原始高度
        CGFloat oldImageHeight = 150;
        //图片变化后的高度
        CGFloat newImageHeight = 150 - y;
        //放大的比例
        CGFloat scale = newImageHeight/oldImageHeight;
        
        //放大图片
        CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
        _headView.transform = transform;
        
        //改变图片的位置
        _headView.top = y;
    }
    
    
 
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *news = _newsData[indexPath.row];
    int index = [news.type intValue];
    if (index == 1) {
        TypeOneController *ImageOne = [[TypeOneController alloc] init];
        [self.navigationController pushViewController:ImageOne animated:YES];
        ImageOne.hidesBottomBarWhenPushed = YES;
    }
    else if (index == 0)
    {
        TypeTwoController *NewsDetail = [[TypeTwoController alloc] init];
        [self.navigationController pushViewController:NewsDetail animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
