//
//  NSDateHeader.h
//  NSDate
//
//  Created by 李自杨 on 2017/5/3.
//  Copyright © 2017年 View. All rights reserved.
//

#ifndef NSDateHeader_h
#define NSDateHeader_h

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
#import <Masonry.h>

#define KWidth self.view.bounds.size.width
#define KHeight self.view.bounds.size.height

#define LZYWeakSelf __weak __typeof(self) weakSelf = self

/*
 
 NSDate -- 表示一个绝对的时间点
 
 NSTimeZone -- 时区信息
 
 NSLocale -- 本地化信息
 
 NSDateComponents -- 一个封装了具体年月日、时秒分、周、季度等的类
 
 NSCalendar -- 日历类，它提供了大部分的日期计算接口，并且允许您在NSDate和NSDateComponents之间转换
 
 NSDateFormatter -- 用来在日期和字符串之间转换
 
 */


#endif /* NSDateHeader_h */
