//
//  MainViewController.m
//  NSDate
//
//  Created by 李自杨 on 2017/5/3.
//  Copyright © 2017年 View. All rights reserved.
//

#import "MainViewController.h"
#import "NSDateViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"时间";
    
    UIButton *btn = [[UIButton alloc]init];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.height.width.mas_equalTo(@50);
        
    }];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnOnClick{

    NSDateViewController *vc = [[NSDateViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

////获取一个月的总天数
//-(void)getNumberOfDaysInMonth{
//    
//    //指定日历的算法
//    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    
//    //获取当前时间
//    NSDate *currentDate = [NSDate date];
//    
//    //只要个时间给日历，就会帮你计算出来，这里的事件取当前的时间
//    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:currentDate];
//    
//    //当前时间显示
//    self.currentLabel.text = [NSString stringWithFormat:@"格林尼治时间:%@",currentDate];
//    //当前时间显示
//    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
//    [dateFormater setDateFormat:@"yyyy年MM年dd日 HH时mm分ss秒"];
//    NSString *dateStrA = [dateFormater stringFromDate:currentDate];
//    self.currentTimeLabel.text = [NSString stringWithFormat:@"北京时间:%@",dateStrA];
//    //当月总天数
//    self.showLabel.text = [NSString stringWithFormat:@"当月一共有%ld天",range.length];
//    
//}

@end
