//
//  MovieCollectionView.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *movieData;
@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, assign) NSInteger index;//当前显示在最中间的单元格的索引

@end
