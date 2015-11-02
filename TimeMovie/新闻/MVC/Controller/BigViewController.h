//
//  BigViewController.h
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BaseViewController.h"

@interface BigViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) NSArray *imageData; //接受imageArray传过来的数据
@property (nonatomic, strong) NSIndexPath *indexPath;//记录前一个页面点中的单元格

@end
