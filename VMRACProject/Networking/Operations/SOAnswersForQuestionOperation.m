//
//  SOAnswersForQuestion.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOAnswersForQuestionOperation.h"
#import "SOHTTPRequestOperationManager.h"

@implementation SOAnswersForQuestionOperation

- (instancetype) initWithQuestionID:(NSString *)questionID
{
	return [super initWithRequest:[NSURLRequest requestWithURL:
								   [NSURL URLWithString:[[SOHTTPRequestOperationManager manager].baseURL.absoluteString stringByAppendingPathComponent:
														 [NSString stringWithFormat:@"questions/%@/answers?order=desc&sort=votes&site=stackoverflow&filter=withbody",questionID]]]]];
}

@end
