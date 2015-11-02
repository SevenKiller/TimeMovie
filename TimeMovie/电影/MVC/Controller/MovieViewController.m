//
//  MovieViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "PostCollectionView.h"
#import "HeadCollectionView.h"

@interface MovieViewController (){
    UIButton *_rightButton;   //导航栏右侧按钮
    
    //中间视图
    UITableView *_listView;      //列表视图
    UIView *_posterView;    //海报视图
    PostCollectionView *_postCollectionView; //海报视图中的视图
    HeadCollectionView *_headCollectionView; //头视图中的海报视图
    
    NSMutableArray *_movieData; //存储电影数据
    
    UIView *_headView;  //头视图
    UIButton *_upDownButton;  //头视图中下拉按钮
    UIView *_coverView; // 遮罩视图
}

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"电影";
    //创建右侧按钮
    [self creatRightButton];
    //读取数据
    [self loadData];
    //创建视图
    [self creatView];
    //创建头视图
    [self creatHeadView];
    
    //添加观察者
    [self addKVO];
    
}

#pragma mark - 读取数据
- (void)loadData
{
  
    //3.文件解析
    //JSONKit TouchJSON SBJSON 第三方解析器->程序大牛 程序公司
    //NSISON 苹果公司自己开发的解析器 稳定 高效 不需要添加第三方框架
    NSDictionary *dic = [MovieJSON readJSONFile:@"us_box"];
    
   
    
    //4.数据处理和存储
    NSArray *subjects = dic[@"subjects"];
    //创建数组
    _movieData = [[NSMutableArray alloc] init];
    //数组遍历
    for (NSDictionary *dictionary in subjects) {
        Movie *movie = [[Movie alloc] initWithContentsOfDictionary:dictionary[@"subject"]];
        //存入数组中
        [_movieData addObject:movie];
    }
    
}


#pragma mark - 创建视图
- (void)creatView{
    
    #pragma mark - 电影列表视图
    _listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _listView.dataSource = self;
    _listView.delegate = self;
    _listView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_listView];
    
    #pragma mark - 电影海报视图
    _posterView = [[UIView alloc] initWithFrame:self.view.bounds];
    _posterView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_posterView];
    _posterView.hidden = YES;
    
    _postCollectionView = [[PostCollectionView alloc] initWithFrame:_posterView.bounds];
    
    // 将电影的数据 传给_postCollectionView
    _postCollectionView.movieArray = _movieData;
    [_posterView addSubview:_postCollectionView];
    
}

#pragma mark - 创建海报视图中的头视图
- (void)creatHeadView
{
    #pragma mark - 创建下拉遮罩视图
    _coverView = [[UIView alloc] initWithFrame:_posterView.bounds];
    _coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    _coverView.hidden = YES;
    [_posterView addSubview:_coverView];
    
    //给遮罩视图 添加单击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewMoveUp)];
    [_coverView addGestureRecognizer:tap];
    
    #pragma mark - 滑动手势
    //向下滑动手势
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(headViewMoveDown)];
    //滑动方向
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [_posterView addGestureRecognizer:swipeDown];
    
    //向上滑动手势
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(headViewMoveUp)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [_posterView addGestureRecognizer:swipeUp];
    
    
    #pragma mark - 创建头部视图
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 - 100, kScreenWidth, 130)];
    _headView.backgroundColor = [UIColor clearColor];
    [_posterView addSubview:_headView];
    
    //读取图片
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    //拉伸图片
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:3];
    //创建一个背景视图
    UIImageView *backView = [[UIImageView alloc] initWithFrame:_headView.bounds];
    backView.image = image;
    [_headView addSubview:backView];
    
    
    //头视图海报
    _headCollectionView = [[HeadCollectionView alloc] initWithFrame:CGRectMake(0, 0, _headView.size.width, 100)];
    _headCollectionView.backgroundColor = [UIColor blackColor];
    _headCollectionView.movieArray = _movieData;
    [_headView addSubview:_headCollectionView];
    
   
    #pragma mark - 创建下拉按钮
    _upDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _upDownButton.frame = CGRectMake(0, 0, 26, 20);
    //设置中心点
    _upDownButton.center = CGPointMake(kScreenWidth/2 +3, 118);
    [_upDownButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_upDownButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [_upDownButton addTarget:self
                      action:@selector(upDownButtonAction:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [_headView addSubview:_upDownButton];
}

#pragma mark - 创建右侧按钮
- (void)creatRightButton
{
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(0, 0, 39, 25);
    //设置背景图片
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    
    [_rightButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateSelected];
    
    
    //添加按钮点击事件
    [_rightButton addTarget:self
                     action:@selector(rightButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    
    //将按钮打包 添加到导航栏上去
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - 右侧按钮点击事件
- (void)rightButtonAction:(UIButton *)button
{
    UIViewAnimationOptions option = button.selected ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [self flipView:_rightButton options:option];
    [self flipView:self.view options:option];
    _rightButton.selected = !_rightButton.selected;
    _listView.hidden = !_listView.hidden;
    _posterView.hidden = !_posterView.hidden;
    
}

/**
 *  将某个视图进行翻转
 *
 *  @param view    需要进行翻转动画的视图
 *  @param options 动画的选项
 */
- (void)flipView:(UIView *)view options:(UIViewAnimationOptions)options
{
    
    //翻转动画
    [UIView transitionWithView:view
                      duration:0.3
                       options:options //动画翻转效果
                    animations:^{
                    }
                    completion:nil];
    
    
}

#pragma mark - 头视图下拉按钮点击事件

-(void)upDownButtonAction:(UIButton *)btn
{
    if (btn.selected)
    {
        [self headViewMoveUp];
    }
    else
    {
        [self headViewMoveDown];
    }
    
}

#pragma mark - 头部视图上下移动控制方法
-(void)headViewMoveUp
{
    [UIView animateWithDuration:0.3 animations:^{
        _headView.top = -36;
        _upDownButton.selected = NO;
        _coverView.hidden = YES;
    }];
    
}

-(void)headViewMoveDown
{
    [UIView animateWithDuration:0.3 animations:^{
        _headView.top = 64;
        _upDownButton.selected = YES;
        _coverView.hidden = NO;
    }];
    
}


#pragma mark - UITableViewDataSource
//返回单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _movieData.count;
}

//返回单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    if (cell == nil) {
       
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil] lastObject];
        
    }
    cell.movie = _movieData[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
//单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120;
}

#pragma mark - KVO
-(void)addKVO
{
    //监听对象
    [_postCollectionView addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
    
    [_headCollectionView addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)dealloc
{
    //移除观察者
    [_postCollectionView removeObserver:self forKeyPath:@"index" ];
    [_headCollectionView removeObserver:self forKeyPath:@"index" ];
    
}

//观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //获取变化后的index值
    NSNumber *itemNumber = change[@"new"];
    NSInteger itemIndex = [itemNumber integerValue];
    //创建indexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:0];
    
    //判断观察对象是那个CollectionView
    if(object == _postCollectionView && indexPath.item != _headCollectionView.index)
    {
        //滑动小的
        [_headCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _headCollectionView.index = indexPath.item;
    }
    else if(object == _headCollectionView && indexPath.item != _postCollectionView.index)
    {
        //滑动大的
        [_postCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _postCollectionView.index = indexPath.item;
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
