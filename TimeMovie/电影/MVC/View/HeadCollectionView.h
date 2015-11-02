//
//  HeadCollectionView.h
//  TimeMovie
//
//  Created by mac on 15/8/28.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "MovieCollectionView.h"

@interface HeadCollectionView : MovieCollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *movieArray;

@end
