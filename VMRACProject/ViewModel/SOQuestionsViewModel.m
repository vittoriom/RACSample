//
//  SOQuestionViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionsViewModel.h"
#import "SOQuestion.h"
#import "SOHTTPRequestOperationManager.h"
#import "SOHotQuestionsOperation.h"

@interface SOQuestionsViewModel ()

- (void) parseModelFromData:(NSData *)responseData;

@end

@implementation SOQuestionsViewModel

- (void) parseModelFromData:(NSData *)responseData
{
	NSError *error;
	NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
	
	self.model = [[[responseDictionary[@"items"] rac_sequence] map:^id(NSDictionary *value) {
		SOQuestion *question = [[SOQuestion alloc] initWithDictionary:value];
		return question;
	}] array];
	
	self.active = NO;
}

- (instancetype) initWithModel:(NSArray *)modelObject
{
    self = [self init];
    if(!self) return nil;
    
    self.model = modelObject;
    
    return self;
}

@end
