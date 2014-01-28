//
//  SOQuestion.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 26/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestion.h"
#import "SOUser.h"

NSString * const kSOQuestionAnswerCount = @"answer_count";
NSString * const kSOQuestionScore = @"score";
NSString * const kSOQuestionCreationDate = @"creation_date";
NSString * const kSOQuestionLink = @"link";
NSString * const kSOQuestionTags = @"tags";
NSString * const kSOQuestionTitle = @"title";
NSString * const kSOQuestionViewsCount = @"view_count";
NSString * const kSOQuestionOwner = @"owner";

@interface SOQuestion ()

@property (nonatomic, assign) NSInteger answerCount;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, strong) NSURL *link;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, assign) NSInteger viewsCount;
@property (nonatomic, strong) SOUser *owner;

@end

@implementation SOQuestion

- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if(!self) return nil;
    
    self.answerCount = [dictionary[kSOQuestionAnswerCount] intValue];
    self.score = [dictionary[kSOQuestionScore] intValue];
    self.creationDate = [NSDate dateWithTimeIntervalSince1970:[dictionary[kSOQuestionCreationDate] longValue]];
    self.link = [NSURL URLWithString:dictionary[kSOQuestionLink]];
    self.title = dictionary[kSOQuestionTitle];
    self.tags = dictionary[kSOQuestionTags];
    self.viewsCount = [dictionary[kSOQuestionViewsCount] intValue];
    self.owner = [[SOUser alloc] initWithDictionary:dictionary[kSOQuestionOwner]];
    
    return self;
}

@end
