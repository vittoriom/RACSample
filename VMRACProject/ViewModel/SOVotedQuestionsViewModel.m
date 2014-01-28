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

@implementation SOVotedQuestionsViewModel

- (instancetype) init
{
	self = [super init];
    if(!self) return nil;
    
	@weakify(self);
    [self.didBecomeActiveSignal subscribeNext:^(id x) {
        @strongify(self);
		
		[[[SOHTTPRequestOperationManager manager] rac_enqueueHTTPRequestOperation:[SOHotQuestionsOperation new]] subscribeNext:^(RACTuple *response) {
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
