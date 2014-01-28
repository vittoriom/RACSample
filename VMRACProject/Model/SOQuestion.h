//
//  SOQuestion.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 26/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SOUser;

@interface SOQuestion : NSObject

@property (nonatomic, readonly) NSInteger answerCount;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSDate *creationDate;
@property (nonatomic, readonly) NSURL *link;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSArray *tags;
@property (nonatomic, readonly) NSInteger viewsCount;
@property (nonatomic, readonly) SOUser *owner;
@property (nonatomic, readonly) NSString *questionID;
@property (nonatomic, readonly) NSString *body;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end
