//
//  AppDelegate.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    HomeViewController *homeVC=[[HomeViewController alloc]init];
      //  UITabBarController *TBbar=[[UITabBarController alloc]init];
    
    Landing *landVC=[[Landing alloc]init];
     UINavigationController *navagationland=[[UINavigationController alloc]initWithRootViewController:landVC];
    [landVC.navigationController setNavigationBarHidden:YES];
    CinemaSearchViewController*cinemaVC=[[CinemaSearchViewController alloc]init];
    UINavigationController *navagationcinama=[[UINavigationController alloc]initWithRootViewController:cinemaVC];
    [cinemaVC.navigationController setNavigationBarHidden:YES];
    CinemaSearchViewController * cineVC2=[[CinemaSearchViewController alloc]init];
    CustomTabBar *tabar=[[CustomTabBar alloc]init];
    UINavigationController *navagationHome=[[UINavigationController alloc]initWithRootViewController:homeVC];
    [homeVC.navigationController setNavigationBarHidden:YES];

    tabar.viewControllers=[NSArray arrayWithObjects:navagationHome,navagationcinama,navagationland,cineVC2, nil];
  //  TBbar.viewControllers=[NSArray arrayWithObjects:homeVC, nil];
    tabar.currentSelectedIndex=0;
    tabar.selectedIndex=0;
    self.window.rootViewController=tabar;
    
    
    [homeVC release];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
