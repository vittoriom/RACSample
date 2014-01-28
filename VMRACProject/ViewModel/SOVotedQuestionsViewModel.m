//
//  SOVotedQuestionsViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOVotedQuestionsViewModel.h"
#import "SOHTTPRequestOperationManager.h"
#import "SOHotQuestionsOperation.h"
#import "SOQuestion.h"

@interface SOQuestionsViewModel (private)

- (void) parseModelFromData:(NSData *)responseData;

@end

@implementation SOVotedQuestionsViewModel

- (instancetype) init
{
	self = [super init];
    if(!self) return nil;
    
	@weakify(self);
    [self.didBecomeActiveSignal subscribeNext:^(id x) {
        @strongify(self);
		
		[[[SOHTTPRequestOperationManager manager] rac_enqueueHTTPRequestOperation:[SOHotQuestionsOperation new]] subscribeNext:^(RACTuple *response) {
			[self parseModelFromData:response.second];
		}];
    }];
    
    return self;
}
@end
