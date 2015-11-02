//
//  PostCollectionView.h
//  TimeMovie
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "MovieCollectionView.h"

@interface PostCollectionView : MovieCollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray *movieArray;

@end
