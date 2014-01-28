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

@implementation SONewestQuestionsViewModel

- (instancetype) init
{
	self = [super init];
    if(!self) return nil;
    
	@weakify(self);
    [self.didBecomeActiveSignal subscribeNext:^(id x) {
        @strongify(self);
		
	    [[[SOHTTPRequestOperationManager manager] rac_enqueueHTTPRequestOperation:[SONewQuestionsOperation new]] subscribeNext:^(RACTuple *response) {
			NSError *error;
			NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:response.second options:0 error:&error];
				
			self.model = [[[responseDictionary[@"items"] rac_sequence] map:^id(NSDictionary *value) {
				SOQuestion *question = [[SOQuestion alloc] initWithDictionary:value];
				return question;
			}] array];
		}];
    }];
    
    return self;
}

@end
