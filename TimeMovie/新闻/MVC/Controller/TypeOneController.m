//
//  TypeOneController.m
//  TimeMovie
//
//  Created by mac on 15/8/23.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "TypeOneController.h"
#import "BigViewController.h"
#import "News.h"

@interface TypeOneController ()
{
    NSMutableArray *_imageArray;
}

@end

@implementation TypeOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新闻图片";
    //创建UICollectionView
    [self creatUICollectionView];
}

#pragma mark - creatUICollectionView
- (void)creatUICollectionView
{
    //UICollectionView---------------------
    // 1. 创建
    // 创建 UICollectionView 之前 需要先创建一个 布局对象
    // UICollectionViewLayout 是一个非常抽象的布局类  里面没有具体的布局条件
    // 一般情况下 我们使用它的子类 UICollectionViewFlowLayout
    
    
    // 创建一个布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置布局规则
    // 水平最小间隙
    flowLayout.minimumInteritemSpacing = 5;
    // 竖直最小间隙
    flowLayout.minimumLineSpacing = 10;
    // 单元格大小
    flowLayout.itemSize = CGSizeMake(65, 65);
    // 滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置四周间隙
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    
    
    // 使用布局对象 来创建UICollectionView
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:collection];
    
    // 数据源对象设置
    collection.dataSource = self;
    collection.delegate = self;
    
    // 注册单元格
    // 使用一个类 来注册单元格
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    // 使用xib来注册单元格
    /*
     UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]];
     [collection registerNib:nib forCellWithReuseIdentifier:@"cell"];
     */
    
    //读取文件
    NSArray *imagelist = [MovieJSON readJSONFile:@"image_list"];
    //创建数组对象
    _imageArray = [[NSMutableArray alloc] init];
    
    //便利
    for (NSDictionary *dic in imagelist) {
        NSString *str = dic[@"image"];
        
        NSURL *url = [NSURL URLWithString:str];
        
        [_imageArray addObject:url];
    }
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //创建一个图片视图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
    //加载网络图片  placeholderImage:网络图片读取的过程中，显示的默认的图片
    [imageView sd_setImageWithURL:_imageArray[indexPath.row] placeholderImage:[UIImage imageNamed:@"more_set"]];
    //设置图片的拉伸模式
//    imageView.contentMode = UIViewContentModeScaleToFill;
    
    cell.backgroundView = imageView;
    
    //设置视图圆角的半径
    cell.layer.cornerRadius = 32.5;
    //设置边框颜色
    cell.layer.borderColor = [[UIColor purpleColor] CGColor];
    //设置边框的宽度
    cell.layer.borderWidth = 3;
    cell.clipsToBounds = YES;
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(65, 65);
    
}

#pragma mark - 单元格的选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BigViewController *bigImage = [[BigViewController alloc]init];
    
    //将图片数据传输给下一个控制器
    bigImage.imageData = _imageArray;
    
    
    bigImage.hidesBottomBarWhenPushed = YES;
    
    //记录本次点击选中的单元格的索引
    bigImage.indexPath = indexPath;
    
    [self.navigationController pushViewController:bigImage animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

