//
//  TimeTableView.m
//  NSDate
//
//  Created by 李自杨 on 2017/5/4.
//  Copyright © 2017年 View. All rights reserved.
//

#import "TimeTableView.h"

@interface TimeTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *timeArray;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TimeTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style withData:(NSArray *)array{
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(getCurrentTime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        
        [self.dataArray addObjectsFromArray:array];
        
        self.delegate = self;
        self.dataSource = self;
        
        UIView *view = [[UIView alloc]init];
        self.tableFooterView = view;
        
    }
    
    return self;
}

#pragma mark -- 懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(NSMutableArray *)timeArray{

    if (_timeArray == nil) {
        _timeArray = [NSMutableArray array];
    }
    return _timeArray;
}

-(void)getCurrentTime{
    
    //当前时间
    NSDate *currentDate = [NSDate date];
    
    //格林尼治时间
    NSString *gmtTimeStr = [NSString stringWithFormat:@"%@",currentDate];
    [self.timeArray removeObject:gmtTimeStr];
    [self.timeArray insertObject:gmtTimeStr atIndex:0];
    
    //北京时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:currentDate];
    
    NSString *beiJingTimeStr = [NSString stringWithFormat:@"%@",dateStr];
    [self.timeArray removeObject:beiJingTimeStr];
    [self.timeArray insertObject:beiJingTimeStr atIndex:1];

    [self reloadData];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellId];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    cell.detailTextLabel.text = _timeArray[indexPath.row];

    return cell;
    
}

//当自己重写一个UIView的时候有可能用到这个方法,当本视图的父类视图改变的时候,系统会自动的执行这个方法.newSuperview是本视图的新父类视图.newSuperview有可能是nil.
-(void)willMoveToSuperview:(UIView *)newSuperview{
    
    [super willMoveToSuperview:newSuperview];
    
    if (! newSuperview && self.timer) {
        // 销毁定时器
        [self.timer invalidate];
        self.timer = nil;
    }
    
}

-(void)dealloc{
    
    NSLog(@"");
    
}

@end
