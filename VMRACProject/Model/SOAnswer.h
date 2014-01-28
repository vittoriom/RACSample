//
//  SOAnswer.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SOUser;

@interface SOAnswer : NSObject

@property (nonatomic, readonly) NSString *body;
@property (nonatomic, readonly) NSString *questionID;
@property (nonatomic, readonly) NSString *answerID;
@property (nonatomic, readonly) NSDate *creationDate;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) SOUser *owner;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end
