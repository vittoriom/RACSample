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
#import "SOQuestionViewController.h"

@implementation VMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 
    SOQuestionViewController *viewController = [[SOQuestionViewController alloc] initWithViewModel:[SOVotedQuestionsViewModel new]];
	viewController.title = @"Hot";
	SOQuestionViewController *viewController2 = [[SOQuestionViewController alloc] initWithViewModel:[SONewestQuestionsViewModel new]];
	viewController2.title = @"New";
	
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = @[viewController,viewController2];
	
    self.window.rootViewController = tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
