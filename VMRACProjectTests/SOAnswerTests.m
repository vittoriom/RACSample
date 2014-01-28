#import "SOUser.h"
#import "SOAnswer.h"

SPEC_BEGIN(SOAnswerTests)

extern NSString * const kSOAnswerScore;
extern NSString * const kSOAnswerQuestionID;
extern NSString * const kSOAnswerID;
extern NSString * const kSOAnswerBody;
extern NSString * const kSOAnswerCreationDate;
extern NSString * const kSOAnswerOwner;
extern NSString * const kSOUserReputation;
extern NSString * const kSOUserID;
extern NSString * const kSOUserPicture;
extern NSString * const kSOUserName;
extern NSString * const kSOUserPermalink;

describe(@"Anwers", ^{
	it(@"should be correctly initialized with a dictionary", ^{
		NSDictionary *mockedDictionary = @{
                                           kSOAnswerBody : @"Body test",
                                           kSOAnswerID : @1090,
                                           kSOAnswerCreationDate : @1340805096,
                                           kSOAnswerQuestionID : @124,
										   kSOAnswerScore : @9000,
                                           kSOAnswerOwner : @{
                                                   kSOUserReputation : @139668,
                                                   kSOUserID : @87234,
                                                   kSOUserPicture : @"http://i.stack.imgur.com/FkjBe.png?s=128&g=1",
                                                   kSOUserName : @"GManNickG",
                                                   kSOUserPermalink : @"http://stackoverflow.com/users/87234/gmannickg"
                                                   }
                                           };
		
        SOAnswer *modelObject = [[SOAnswer alloc] initWithDictionary:mockedDictionary];
        
        [[modelObject.answerID should] equal:@"1090"];
        [[modelObject.questionID should] equal:@"124"];
        [[modelObject.creationDate should] equal:[[NSDate alloc] initWithTimeIntervalSince1970:1340805096]];
        [[modelObject.body should] equal:@"Body test"];
        [[@(modelObject.score) should] equal:@9000];
        [modelObject.owner shouldNotBeNil];
	});
});

SPEC_END