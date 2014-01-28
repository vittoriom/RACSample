//
//  SOQuestionsOperation.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionsOperation.h"
#import "SOHTTPRequestOperationManager.h"

@implementation SOQuestionsOperation

- (instancetype) initWithPage:(NSUInteger)pageNumber withPageSize:(NSUInteger)size sortedBy:(NSString *)sort
{
	NSNumber *pageNum = [NSNumber numberWithUnsignedInteger:pageNumber ?: 1];
	NSNumber *pageSize = [NSNumber numberWithUnsignedInteger:size ?: 25];
	NSString *sortCriteria = sort ?: @"creation";
	
	return [super initWithRequest:[NSURLRequest requestWithURL:
								   [NSURL URLWithString:[[SOHTTPRequestOperationManager manager].baseURL.absoluteString
														 stringByAppendingPathComponent:
														 [NSString stringWithFormat:@"questions?page=%@&pagesize=%@&order=desc&sort=%@&site=stackoverflow",pageNum,pageSize,sortCriteria]]]]];
}

@end
