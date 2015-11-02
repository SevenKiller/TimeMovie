//
//  CinemaViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "CinemaViewController.h"
#import "cinema.h"
#import "CinemaCell.h"
#import "district.h"

@interface CinemaViewController (){
    UITableView *_countyView;   // 视图

    
    NSMutableArray *_districtData; //存储地方影院数据的数组
    NSMutableArray *_area; // 地名
    NSMutableArray *_areaid;
    NSMutableArray *_information; //影院信息
    
    NSMutableArray *_sameArray;//相同id影院数组
    
    NSMutableArray *_isSected;  //点击组头视图之后是否隐藏其下的单元格，即储存行数打开关闭的状态
}

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"影院";
    //数据读取
    [self loadData];
    //创建视图
    [self creatTableView];
    
    
}

#pragma mark - 数据读取
- (void)loadData
{
    //地区数据读取
    NSDictionary *districtDic = [MovieJSON readJSONFile:@"district_list"];
    NSArray *districArray = districtDic[@"districtList"]; //存储地区数据的数组
//    _districtData = [[NSMutableArray alloc] init];
    _area = [[NSMutableArray alloc] init];
    _areaid = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in districArray)
    {
        [_area addObject:dic[@"name"]];
        [_areaid addObject:dic[@"id"]];
//        district *dist = [[district alloc] initContentWithDic:dic];
//        [_districtData addObject:dist];
    }
    
    //读取电影院数据
    NSDictionary *dic = [MovieJSON readJSONFile:@"cinema_list"];
    NSArray *array = dic[@"cinemaList"];
    _information = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array)
    {
        cinema *cin = [[cinema alloc] initContentWithDic:dic];
        
        [_information addObject:cin];
    }
    
    //因为ID是判断那个影院是属于那个城市的，所以将id相同的保存在一起
    _sameArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _areaid.count; i++)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (int j = 0; j < _information.count; j++)
        {
            //遍历取出_cinemaData中的数据
            cinema *c = _information[j];
            //如果cinema的districtId等于_idData的id，则将cinema保存到数组array中
            if ([c.districtId isEqualToString:_areaid[i]])
            {
                [array addObject:c];
            }
        }
        //将保存了分别具有相同id的数组保存到数组_nameData中
        [_sameArray addObject:array];
    }

    //为每个分组创建一个判断
    _isSected = [[NSMutableArray alloc] init];
    for (int i = 0; i<_sameArray.count; i++) {
        _isSected[i] = @"NO";//初始状态是不开启
    }
}

#pragma mark - 创建视图
- (void)creatTableView
{
    _countyView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _countyView.dataSource = self;
    _countyView.delegate = self;
    
    //索引字体颜色
    _countyView.sectionIndexColor = [UIColor purpleColor];
    
    _countyView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    [self.view addSubview:_countyView];
}


#pragma mark - UITableViewDataSource
//组的头视图上的标题，此方法有多少组就会调用多少次
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return _area[section];
}

//1.组的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    
    return _area.count;
}

//返回索引
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    
//    return _countyArray;
//}

//每一组中单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //如果是打开状态，显示他的内部单元格
    if ([_isSected[section] isEqualToString:@"YES"])
    {
        NSArray *array = _sameArray[section];
        
        return array.count;
    }
    //否则隐藏
    return 0;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //到重用池中查找
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCell"];
    if (cell == nil) {
        //创建单元格
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CinemaCell" owner:nil options:nil] lastObject];
        
    }
    
    cell.cinema = _sameArray[indexPath.section][indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
//2.头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}


//组的头视图上的标题，此方法有多少组就会调用多少次
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, kScreenWidth, 45);
    [btn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_bg_all-64"]]];
    [btn setTitle:_area[section] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = section;
    
    return btn;
    
}

//单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}

//头视图按钮点击事件
- (void)btnAction:(UIButton *)btn
{
    if ([_isSected[btn.tag] isEqualToString:@"NO"]) {
        
        //点击时候的button的单元格显示状态
        _isSected[btn.tag] = @"YES";
        
        //
        [_countyView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag]
                  withRowAnimation:UITableViewRowAnimationFade];
    }
    else if ([_isSected[btn.tag] isEqualToString:@"YES"])
    {
        _isSected[btn.tag] = @"NO";
        [_countyView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
