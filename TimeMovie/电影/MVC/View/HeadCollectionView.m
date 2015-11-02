//
//  HeadCollectionView.m
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "HeadCollectionView.h"
#import "Movie.h"

@implementation HeadCollectionView

//直接调用父类MovieCollectionView(在基类View中)方法

//- (instancetype)initWithFrame:(CGRect)frame
//{
//#pragma mark - 创建海报视图的UICollectionView
//    // 创建布局对象
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    // 设置布局规则
//    // 水平最小间隙
//    layout.minimumInteritemSpacing = 10;
//    // 单元格大小
//    layout.itemSize = CGSizeMake(frame.size.height * 0.7, frame.size.height * 0.9);
//    // 滑动方向
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;;
//    // 设置四周间隙
//    CGFloat x = (frame.size.width - frame.size.height *0.5) / 2;
//    layout.sectionInset = UIEdgeInsetsMake(0, x, 0, x);
//    
//    self = [super initWithFrame:frame collectionViewLayout:layout];
//    
//    if (self) {
//        // 数据源对象设置
//        self.dataSource = self;
//        self.delegate = self;
//        self.showsHorizontalScrollIndicator = NO;
//        
//        // 注册单元格
//        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    }
//    
//    return self;
//}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _movieArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.4 blue:0.76 alpha:1];
    // 背景图片视图
    UIImageView *image = [[UIImageView alloc] initWithFrame:cell.bounds];
    cell.backgroundView = image;
    
    Movie *movie = _movieArray[indexPath.row];
    
    NSURL *url = [NSURL URLWithString:movie.images[@"small"]];
    [image sd_setImageWithURL:url];
    
    return cell;
}


// 单元格的选中方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 单元格滑动
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    //改变index ： 单元格索引值
    self.index = indexPath.item;
}


@end
