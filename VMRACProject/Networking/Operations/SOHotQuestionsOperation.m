//
//  SOHotQuestionsOperation.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOHotQuestionsOperation.h"
#import "SOHTTPRequestOperationManager.h"

@implementation SOHotQuestionsOperation

- (instancetype) init
{
	return [super initWithPage:1 withPageSize:25 sortedBy:@"votes"];
}

@end
