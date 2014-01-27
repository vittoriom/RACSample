//
//  VMAppDelegate.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 26/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "VMAppDelegate.h"
#import "SOQuestionViewModel.h"
#import "SOQuestionViewController.h"

@implementation VMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 
    SOQuestionViewController *viewController = [[SOQuestionViewController alloc] initWithViewModel:[[SOQuestionViewModel alloc] initWithModel:nil]];
    self.window.rootViewController = viewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
