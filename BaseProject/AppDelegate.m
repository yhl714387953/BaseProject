//
//  AppDelegate.m
//  BaseProject
//
//  Created by L's on 16/8/18.
//  Copyright © 2016年 L's. All rights reserved.
//

#import "AppDelegate.h"
//#import <LeftViewController.h>
#import <CollectionViewController.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    CollectionViewController* vc = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    
    __weak typeof(self) weakSelf = self;
    vc.naviItemBlock = ^(UIBarButtonItem* item){
        NSLog(@"点到了");
        [weakSelf.sideViewController showLeftViewController:YES];
    };
    
    UINavigationController* navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    
    Class leftVC = NSClassFromString(@"LeftViewController");
    UIViewController *leftViewController= [[leftVC alloc] init];
    leftViewController.view.backgroundColor=[UIColor brownColor];
    
    UIViewController *rightViewController=[[UIViewController alloc]initWithNibName:nil bundle:nil];
    rightViewController.view.backgroundColor=[UIColor purpleColor];
    
    _sideViewController=[[YRSideViewController alloc]initWithNibName:nil bundle:nil];
    _sideViewController.rootViewController= navi;
    _sideViewController.leftViewController=leftViewController;
    _sideViewController.rightViewController=rightViewController;
    
    
    _sideViewController.leftViewShowWidth= 240;// self.window.bounds.size.width * 0.7;
    _sideViewController.needSwipeShowMenu=true;//默认开启的可滑动展示
    //动画效果可以被自己自定义，具体请看api
    
    
    self.window.rootViewController=_sideViewController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
