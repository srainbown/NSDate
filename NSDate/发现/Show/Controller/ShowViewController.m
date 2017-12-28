//
//  ShowViewController.m
//  NSDate
//
//  Created by 李自杨 on 2017/5/3.
//  Copyright © 2017年 View. All rights reserved.
//

#import "ShowViewController.h"
#import "TimeTableView.h"
@interface ShowViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) TimeTableView *timeTableView;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _vcTitle;
    
    [self createTimeTableView];
    
}

#pragma mark -- 懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
    
}


-(void)createTimeTableView{
    
    [self.dataArray addObject:@"格林尼治时间"];
    [self.dataArray addObject:@"北京时间"];
    
    _timeTableView = [[TimeTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain withData:_dataArray];
    [self.view addSubview:_timeTableView];
    
}

-(void)dealloc{
    
    NSLog(@"");
}

@end
