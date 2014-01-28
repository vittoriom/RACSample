//
//  SONewQuestionsOperation.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SONewQuestionsOperation.h"
#import "SOHTTPRequestOperationManager.h"

@implementation SONewQuestionsOperation

- (instancetype) init
{
	self = [super initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[SOHTTPRequestOperationManager manager].baseURL.absoluteString stringByAppendingPathComponent:@"questions?page=1&pagesize=25&order=desc&sort=creation&site=stackoverflow"]]]];
	
	if(!self) return nil;
	
	return self;
}

@end
