//
//  VMAppDelegate.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 26/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "VMAppDelegate.h"
#import "SONewestQuestionsViewModel.h"
#import "SOVotedQuestionsViewModel.h"
#import "SOQuestionsViewController.h"

@implementation VMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 
    SOQuestionsViewController *viewController = [[SOQuestionsViewController alloc] initWithViewModel:[SOVotedQuestionsViewModel new]];
	viewController.title = @"Hot";
	SOQuestionsViewController *viewController2 = [[SOQuestionsViewController alloc] initWithViewModel:[SONewestQuestionsViewModel new]];
	viewController2.title = @"New";
	
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = @[viewController,viewController2];
	
    self.window.rootViewController = tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
