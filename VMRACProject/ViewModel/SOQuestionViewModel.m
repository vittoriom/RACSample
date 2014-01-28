//
//  SOQuestionViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewModel.h"
#import "SOQuestion.h"
#import "SOHTTPRequestOperationManager.h"
#import "SOHotQuestionsOperation.h"

@interface SOQuestionViewModel ()

- (void) parseModelFromData:(NSData *)responseData;

@end

@implementation SOQuestionViewModel

- (void) parseModelFromData:(NSData *)responseData
{
	NSError *error;
	NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
	
	self.model = [[[responseDictionary[@"items"] rac_sequence] map:^id(NSDictionary *value) {
		SOQuestion *question = [[SOQuestion alloc] initWithDictionary:value];
		return question;
	}] array];
}

- (instancetype) initWithModel:(NSArray *)modelObject
{
    self = [self init];
    if(!self) return nil;
    
    self.model = modelObject;
    
    return self;
}

@end
