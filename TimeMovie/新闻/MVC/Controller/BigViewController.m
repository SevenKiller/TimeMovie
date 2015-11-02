//
//  BigViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "BigViewController.h"
#import "BigViewCell.h"

@interface BigViewController ()
{
    UIButton *_leftButton;
    
    NSMutableArray *_imageArray;
//    创建UICollectionView
    UICollectionView *_collectionView;
    
    BOOL _isHiddenNavigationBar;
}

@end

@implementation BigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    //创建导航栏返回按钮
//    [self creatLeftButton];
    //创建UICollectionView
    [self creatUICollectionView];
    
    //根据记录的单元格索引 来显示那个单元格
    [_collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    _isHiddenNavigationBar = NO;
    
    //接受隐藏导航栏的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNavigationBar) name:@"hiddenNavigationBar" object:nil];
    
}

- (void)hiddenNavigationBar
{
    _isHiddenNavigationBar = !_isHiddenNavigationBar;
    //根据当前导航栏状态来显示隐藏导航栏
    [self.navigationController setNavigationBarHidden:_isHiddenNavigationBar animated:YES];
    //同时隐藏状态栏
    UIApplication *app = [UIApplication sharedApplication];
    //设置状态栏的隐藏和现实
    [app setStatusBarHidden:_isHiddenNavigationBar withAnimation:UIStatusBarAnimationFade];
}


- (void)dealloc
{
    // 移除相应掉通知
    // 如果通知不移除，容易造成程序崩溃
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - creatUICollectionView
- (void)creatUICollectionView
{
    // 创建一个布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置布局规则
    // 水平最小间隙
    flowLayout.minimumInteritemSpacing = 10;
    // 单元格大小
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight -64);
    // 滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置四周间隙
    flowLayout.sectionInset = UIEdgeInsetsMake(-15, 0, 0, 0);
 
    // 使用布局对象 来创建UICollectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth+10, kScreenHeight - 64) collectionViewLayout:flowLayout];
    
   // _collectionView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_collectionView];
    
    // 数据源对象设置,协议
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //分页
    _collectionView.pagingEnabled = YES;
    
    //隐藏滑块
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    // 注册单元格
    // 使用一个类 来注册单元格
    [_collectionView registerClass:[BigViewCell class] forCellWithReuseIdentifier:@"BigViewCell"];
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageData.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //1.显示图片
    //2.双击放大/缩小
    //3.单击隐藏导航栏和状态栏
    //4.双指捏合 缩放视图
    BigViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BigViewCell" forIndexPath:indexPath];
    

    //传入图片数据
    cell.imageURL = _imageData[indexPath.item];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获取单元格 强制类型转换
    BigViewCell *big = (BigViewCell *)cell;
    //将单元格中的图片缩放还原
    [big backImageZoomingScale];
    
}

/*
#pragma mark - 创建左侧按钮
- (void)creatLeftButton
{
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(0, 0, 39, 25);
    
    [_leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
   
    //添加按钮点击事件
    [_leftButton addTarget:self
                     action:@selector(leftButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    
    //将按钮打包 添加到导航栏上去
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)leftButtonAction:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
