#import "SOUser.h"

SPEC_BEGIN(SOUserTests)

describe(@"Users", ^{
    it(@"should be correctly initialized with a full JSON Dictionary", ^{
        NSDictionary *mockedDictionary = @{
                                           kSOUserBadges : @{
                                               kSOUserBronzeBadges : @5362,
                                               kSOUserSilverBadges : @3929,
                                               kSOUserGoldBadges : @250
                                           },
                                           kSOUserAccountID : @11683,
                                           kSOUserReputation : @642812,
                                           kSOUserID : @22656,
                                           kSOUserAge : @37,
                                           kSOUserLocation : @"Reading, United Kingdom",
                                           kSOUserWebsite : @"http://csharpindepth.com",
                                           kSOUserPermalink : @"http://stackoverflow.com/users/22656/jon-skeet",
                                           kSOUserName : @"Jon Skeet",
                                           kSOUserPicture : @"https://www.gravatar.com/avatar/6d8ebb117e8d83d74ea95fbdd0f87e13?s=128&d=identicon&r=PG"
                                           };
        
        SOUser *modelObject = [[SOUser alloc] initWithDictionary:mockedDictionary];
        
        [[@(modelObject.reputation) should] equal:@642812];
        [[@(modelObject.userID) should] equal:@22656];
        [[modelObject.pictureURL should] equal:[NSURL URLWithString:@"https://www.gravatar.com/avatar/6d8ebb117e8d83d74ea95fbdd0f87e13?s=128&d=identicon&r=PG"]];
        [[modelObject.username should] equal:@"Jon Skeet"];
        [[modelObject.profileURL should] equal:[NSURL URLWithString:@"http://stackoverflow.com/users/22656/jon-skeet"]];
        [[@(modelObject.bronzeBadges) should] equal:@5362];
        [[@(modelObject.silverBadges) should] equal:@3929];
        [[@(modelObject.goldBadges) should] equal:@250];
        [[@(modelObject.accountID) should] equal:@11683];
        [[@(modelObject.age) should] equal:@37];
        [[modelObject.location should] equal:@"Reading, United Kingdom"]];
        [[modelObject.profileURL should] equal:[NSURL URLWithString:@"http://csharpindepth.com"]];
    });
    
    it(@"should be correctly initialized with a light JSON Dictionary", ^{
        NSDictionary *mockedDictionary = @{
                                           kSOUserReputation : @139668,
                                           kSOUserID : @87234,
                                           kSOUserPicture : @"http://i.stack.imgur.com/FkjBe.png?s=128&g=1",
                                           kSOUserName : @"GManNickG",
                                           kSOUserPermalink : @"http://stackoverflow.com/users/87234/gmannickg"
                                           };
        
        SOUser *modelObject = [[SOUser alloc] initWithDictionary:mockedDictionary];
        
        [[@(modelObject.reputation) should] equal:@139668];
        [[@(modelObject.userID) should] equal:@87234];
        [[modelObject.pictureURL should] equal:[NSURL URLWithString:@"http://i.stack.imgur.com/FkjBe.png?s=128&g=1"]];
        [[modelObject.username should] equal:@"GManNickG"];
        [[modelObject.profileURL should] equal:[NSURL URLWithString:@"http://stackoverflow.com/users/87234/gmannickg"]];
    });
    
    it(@"should return nil if dictionary is nil", ^{
        SOUser *modelObject = [[SOUser alloc] initWithDictionary:nil];
        [[modelObject should] beNil];
    });
});

SPEC_END