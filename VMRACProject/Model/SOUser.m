//
//  SOUser.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 26/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOUser.h"

NSString * const kSOUserBadges = @"badge_counts";
NSString * const kSOUserBronzeBadges = @"bronze";
NSString * const kSOUserSilverBadges = @"silver";
NSString * const kSOUserGoldBadges = @"gold";
NSString * const kSOUserAccountID = @"account_id";
NSString * const kSOUserReputation = @"reputation";
NSString * const kSOUserID = @"user_id";
NSString * const kSOUserAge = @"age";
NSString * const kSOUserLocation = @"location";
NSString * const kSOUserWebsite = @"website_url";
NSString * const kSOUserPermalink = @"link";
NSString * const kSOUserName = @"display_name";
NSString * const kSOUserPicture = @"profile_image";

@interface SOUser ()

@property (nonatomic, assign) NSInteger reputation;
@property (nonatomic, assign) NSInteger userID;
@property (nonatomic, strong) NSURL *pictureURL;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSURL *profileURL;
@property (nonatomic, assign) NSInteger bronzeBadges;
@property (nonatomic, assign) NSInteger silverBadges;
@property (nonatomic, assign) NSInteger goldBadges;
@property (nonatomic, assign) NSInteger accountID;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSURL *websiteURL;

@end

@implementation SOUser

- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if(!self) return nil;
    
    self.reputation = [dictionary[kSOUserReputation] intValue];
    self.userID = [dictionary[kSOUserID] intValue];
    self.pictureURL = [NSURL URLWithString:dictionary[kSOUserPicture]];
    self.username = dictionary[kSOUserName];
    self.profileURL = [NSURL URLWithString:dictionary[kSOUserPermalink]];
    
    NSDictionary *badges = dictionary[kSOUserBadges];
    self.bronzeBadges = [badges[kSOUserBronzeBadges] intValue];
    self.silverBadges = [badges[kSOUserSilverBadges] intValue];
    self.goldBadges = [badges[kSOUserGoldBadges] intValue];
    
    self.accountID = [dictionary[kSOUserAccountID] intValue];
    self.age = [dictionary[kSOUserAge] intValue];
    self.location = dictionary[kSOUserLocation];
    self.websiteURL = [NSURL URLWithString:dictionary[kSOUserWebsite]];
    
    return self;
}

@end
