//
//  AppDelegate.m
//  NSDate
//
//  Created by 李自杨 on 2017/5/3.
//  Copyright © 2017年 View. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DiscoverViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //主页
    MainViewController *mainVc = [[MainViewController alloc]init];
    UINavigationController *mainNavi = [[UINavigationController alloc]initWithRootViewController:mainVc];
    mainVc.tabBarItem.title = @"主页";
    mainVc.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_home_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    //发现
    DiscoverViewController *disVc = [[DiscoverViewController alloc]init];
    UINavigationController *disNavi = [[UINavigationController alloc]initWithRootViewController:disVc];
    disVc.tabBarItem.title = @"发现";
    disVc.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_discover_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    disVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_discover_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    //TabBar
    UITabBarController *tabbar = [[UITabBarController alloc]init];
    [tabbar setViewControllers:@[mainNavi,disNavi]];
    tabbar.selectedIndex = 1;
    
    self.window.rootViewController = tabbar;

    return YES;
}


@end
