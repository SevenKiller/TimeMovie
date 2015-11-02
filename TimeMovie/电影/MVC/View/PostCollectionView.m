//
//  PostCollectionView.m
//  TimeMovie
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "PostCollectionView.h"
#import "PostCell.h"

@implementation PostCollectionView

//192,340

//可以继承MovieCollectionView(在基类View中)方法
- (instancetype)initWithFrame:(CGRect)frame
{
    #pragma mark - 创建海报视图的UICollectionView
    // 创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置布局规则
    // 水平最小间隙
    layout.minimumInteritemSpacing = 10;
    // 单元格大小
    layout.itemSize = CGSizeMake(frame.size.width * 0.6 , frame.size.height * 0.6);
    // 滑动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;;
    // 设置四周间隙
    layout.sectionInset = UIEdgeInsetsMake(0, frame.size.width * 0.2, 0, frame.size.height * 0.2);
    
    self = [super initWithFrame:frame collectionViewLayout:layout];

    if (self) {
        // 数据源对象设置
        self.dataSource = self;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        
        // 注册单元格
        UINib *nib = [UINib nibWithNibName:@"PostCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"postCell"];
    }
    
    return self;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _movieArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"postCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.4 blue:0.76 alpha:1];
    cell.movie = _movieArray[indexPath.item];
    return cell;
}
 
#pragma mark - UIScrollViewDelegate
/**
 *  滑动视图 即将结束拖拽时 调用的代理方法
 *
 *  @param scrollView          滑动视图
 *  @param velocity            手指离开屏幕时，视图滑动的速度
 *  @param targetContentOffset 滑动结束后 视图的偏离量
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
//    NSLog(@"velocity = %f",velocity.x);
    
    //targetContentOffset 指向结构体的指针 要使用->来访问里面的变量
//    NSLog(@"targetContentOffset = %f",targetContentOffset->x);
    
    /**
     *  实现自定义的分页效果
     *  1.获取视图停止之后的偏移量
     *  2.根据偏移量计算停止之后所在的页码
     *  3.计算此页 显示在正中间时 滑动视图的偏移量
     *  4.将计算所得的偏移量 设置给滑动视图
     */
    //1
    CGFloat xOffset = targetContentOffset -> x;
    xOffset -= scrollView.width * 0.3;
    
    //2.
    NSInteger index = xOffset / (scrollView.width * 0.6 +10);
    if (xOffset > 0) {
        index += 1;
    }
    
    //3.
    xOffset = index * (scrollView.width * 0.6 + 10);
    
    //4.
    targetContentOffset->x = xOffset;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据偏移量 计算正中间单元格的索引
    NSInteger index = collectionView.contentOffset.x / (collectionView.width * 0.6 + 10);
    // 判断选中的单元格 是不是正中间单元格
    if (indexPath.item == index)
    {
        // 1. YES  翻转这个单元格
        // 获取单元格
        PostCell *cell = (PostCell *)[collectionView cellForItemAtIndexPath:indexPath];
        // 翻转单元格
        [cell filpCell];
    }
    else
    {
        // 2. NO   这个单元格 移动到正中间
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        //改变index索引值
        self.index = indexPath.item;
        
        // 将前一个单元格 翻转回来
        // 获取单元格
        PostCell *cell = (PostCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        
        [cell cancelFilp];
       
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostCell *postCell = (PostCell *)cell;
    [postCell cancelFilp];
    
}


@end
