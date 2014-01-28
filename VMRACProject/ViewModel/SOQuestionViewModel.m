//
//  SOQuestionViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewModel.h"
#import "SOQuestion.h"
#import "SOAnswersForQuestionOperation.h"
#import "SOHTTPRequestOperationManager.h"

@interface SOQuestionViewModel ()

@property (nonatomic, strong) SOQuestion *model;

@end

@implementation SOQuestionViewModel

- (instancetype) initWithModel:(SOQuestion *)modelObject
{
	self = [super init];
	if(!self) return nil;
	
	self.model = modelObject;
		
	return self;
}

- (RACSignal *) loadAnswers
{
	RACReplaySubject *subject = [RACReplaySubject subject];
	
	[[[SOHTTPRequestOperationManager manager] rac_enqueueHTTPRequestOperation:[[SOAnswersForQuestionOperation alloc] initWithQuestionID:self.model.questionID] ] subscribeNext:^(RACTuple *response) {
		NSData *responseData = response.second;
		NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
		
		[subject sendNext:responseDictionary];
		[subject sendCompleted];
	}];
	
	return subject;
}

@end
