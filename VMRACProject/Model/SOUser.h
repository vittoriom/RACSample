//
//  SOUser.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 26/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOUser : NSObject

@property (nonatomic, readonly) NSInteger reputation;
@property (nonatomic, readonly) NSInteger userID;
@property (nonatomic, readonly) NSURL *pictureURL;
@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSURL *profileURL;
@property (nonatomic, readonly) NSInteger bronzeBadges;
@property (nonatomic, readonly) NSInteger silverBadges;
@property (nonatomic, readonly) NSInteger goldBadges;
@property (nonatomic, readonly) NSInteger accountID;
@property (nonatomic, readonly) NSInteger age;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSURL *websiteURL;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end
