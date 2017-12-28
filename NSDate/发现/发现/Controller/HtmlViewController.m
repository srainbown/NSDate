//
//  HtmlViewController.m
//  NSDate
//
//  Created by 李自杨 on 2017/5/4.
//  Copyright © 2017年 View. All rights reserved.
//

#import "HtmlViewController.h"
#import <WebKit/WebKit.h>

@interface HtmlViewController ()

@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation HtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _wkWebView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_wkWebView];
    
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
}



@end
