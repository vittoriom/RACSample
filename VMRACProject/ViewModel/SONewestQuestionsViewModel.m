//
//  SONewestQuestionsViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SONewestQuestionsViewModel.h"
#import "SOHTTPRequestOperationManager.h"
#import "SONewQuestionsOperation.h"
#import "SOQuestion.h"

@interface SOQuestionViewModel (private)

- (void) parseModelFromData:(NSData *)responseData;

@end

@implementation SONewestQuestionsViewModel

- (instancetype) init
{
	self = [super init];
    if(!self) return nil;
    
	@weakify(self);
    [self.didBecomeActiveSignal subscribeNext:^(id x) {
        @strongify(self);
		
	    [[[SOHTTPRequestOperationManager manager] rac_enqueueHTTPRequestOperation:[SONewQuestionsOperation new]] subscribeNext:^(RACTuple *response) {
			[self parseModelFromData:response.second];
		}];
    }];
    
    return self;
}

@end
