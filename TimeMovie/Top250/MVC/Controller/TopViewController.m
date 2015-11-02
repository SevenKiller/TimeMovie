//
//  TopViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "TopViewController.h"
#import "DetailViewController.h"
#import "TopModel.h"
#import "TopCell.h"

@interface TopViewController ()
{
    NSMutableArray *_topData;
    
}

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Top250";
    
    [self loadData];
    
    
}

#pragma mark - 读取数据
- (void)loadData
{
    //调用MovieJSON读取数据文件
    NSDictionary *dictionary = [MovieJSON readJSONFile:@"top250"];
    //数据处理和存储
    NSArray *subjects = dictionary[@"subjects"];
    //初始化数组
    _topData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in subjects) {
        TopModel *top = [[TopModel alloc] initWithContentsOfDictionary:dic];
        [_topData addObject:top];
    }

    
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _topData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    cell.topModel = _topData[indexPath.item];
    
    return cell;
}

//单元格高度和宽度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = (kScreenWidth - 10 * 4) / 3;
    return CGSizeMake(cellWidth,cellWidth*1.3);
}

//单元格选中事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //从故事版中获取视图控制器
    //1.获取故事版对象
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    //2.从故事版中获取视图控制器
    DetailViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"detail"];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
