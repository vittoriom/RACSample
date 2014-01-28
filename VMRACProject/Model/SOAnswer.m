//
//  SOAnswer.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOAnswer.h"
#import "SOUser.h"

NSString * const kSOAnswerScore = @"score";
NSString * const kSOAnswerQuestionID = @"question_id";
NSString * const kSOAnswerID = @"answer_id";
NSString * const kSOAnswerBody = @"body";
NSString * const kSOAnswerCreationDate = @"creation_date";
NSString * const kSOAnswerOwner = @"owner";

@interface SOAnswer ()

@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *questionID;
@property (nonatomic, strong) NSString *answerID;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, strong) SOUser *owner;

@end

@implementation SOAnswer

- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if(!self) return nil;
    
    self.score = [dictionary[kSOAnswerScore] intValue];
    self.creationDate = [NSDate dateWithTimeIntervalSince1970:[dictionary[kSOAnswerCreationDate] longValue]];
    self.owner = [[SOUser alloc] initWithDictionary:dictionary[kSOAnswerOwner]];
    self.questionID = [NSString stringWithFormat:@"%d",[dictionary[kSOAnswerQuestionID] intValue]];
    self.answerID = [NSString stringWithFormat:@"%d",[dictionary[kSOAnswerID] intValue]];
	self.body = dictionary[kSOAnswerBody];
	
    return self;
}

@end
