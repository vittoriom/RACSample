//
//  SOSessionManager.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOSessionManager.h"

@implementation SOSessionManager

+ (instancetype) manager
{
    static SOSessionManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SOSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.stackexchange.com/2.1/"]];
    });
    
    return sharedManager;
}

@end
