//
//  DiscoverViewController.m
//  NSDate
//
//  Created by 李自杨 on 2017/5/3.
//  Copyright © 2017年 View. All rights reserved.
//

#import "DiscoverViewController.h"
#import "HtmlViewController.h"
#import "ShowViewController.h"

@interface DiscoverViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *disTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"计时器";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"next_icon"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = right;
    
    
    [self getData];
    [self createTableView];
}

#pragma mark -- 懒加载
-(NSMutableArray *)dataArray{

    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

#pragma mark -- 数据
-(void)getData{
    
    [self.dataArray addObject:@"时间"];
    [self.dataArray addObject:@"计时器"];
    
}

#pragma mark -- UI
-(void)createTableView{
    
    _disTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_disTableView];
    
    _disTableView.delegate = self;
    _disTableView.dataSource = self;
    
    UIView *view = [[UIView alloc]init];
    _disTableView.tableFooterView = view;

}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
        cell.backgroundColor = [UIColor orangeColor];
        cell.textLabel.font = [UIFont systemFontOfSize:30];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShowViewController *vc = [[ShowViewController alloc]init];
    
//    系统在push B的时候，B控制器其实已经加入到导航控制器的子控制器中了；
//    此时，B才是最顶部的控制器，B的hidesBottomBarWhenPushed属性才是正确控制tabbar隐藏的关键，而不是A的；
    vc.hidesBottomBarWhenPushed = YES;
    vc.vcTitle = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark -- 导航栏右侧的按钮
-(void)btnOnClick{

    HtmlViewController *vc = [[HtmlViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
