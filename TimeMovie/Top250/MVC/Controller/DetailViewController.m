//
//  DetailViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 jiliang. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailHeadView.h"
#import "Comment.h"
#import "CommentCell.h"


@interface DetailViewController ()
{
    
    NSMutableArray *_comments;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影详情";
    
    [self loadData];
    
    // 读取xib
    DetailHeadView *head = [[[NSBundle mainBundle]loadNibNamed:@"DetailHeadView" owner:nil options:nil] lastObject];
    _tableView.tableHeaderView = head;
    head.navigationCollectioner = self.navigationController;
}

- (void)loadData
{
    
    //读取用户评论列表数据
    NSDictionary *dic = [MovieJSON readJSONFile:@"movie_comment"];
    NSArray *array = dic[@"list"];
    _comments = [[NSMutableArray alloc] init];
    for (NSDictionary *d in array)
    {
        Comment *c = [[Comment alloc] initContentWithDic:d];
        [_comments addObject:c];
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _comments.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    cell.comment = _comments[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // 计算字符Label高度
    // 拿到当前行的评论对象
    Comment *comment = _comments[indexPath.row];
    
    if (comment.isShow)
    {
        // 评论的内容
        NSString *string = comment.content;
        // 根据字符串的长度 计算Label的大小
        CGSize maxSize = CGSizeMake(kScreenWidth - 80, CGFLOAT_MAX);
        NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGRect rect = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return rect.size.height + 50;
    }
    else
    {
        return 60;
    }
}

// 单元格的选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 改变这条数据的显示状态
    Comment *comment = _comments[indexPath.row];
    comment.isShow = !comment.isShow;
    // 刷新单元格
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
