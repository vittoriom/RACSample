#import "SOQuestion.h"
#import "SOUser.h"

extern NSString * const kSOUserReputation;
extern NSString * const kSOUserID;
extern NSString * const kSOUserPermalink;
extern NSString * const kSOUserName;
extern NSString * const kSOUserPicture;

extern NSString * const kSOQuestionAnswerCount;
extern NSString * const kSOQuestionScore;
extern NSString * const kSOQuestionCreationDate;
extern NSString * const kSOQuestionLink;
extern NSString * const kSOQuestionTags;
extern NSString * const kSOQuestionTitle;
extern NSString * const kSOQuestionViewsCount;
extern NSString * const kSOQuestionOwner;

SPEC_BEGIN(SOQuestionTests)

describe(@"Questions", ^{
    it(@"should be correctly initialized with a JSON Dictionary", ^{
        NSDictionary *mockedDictionary = @{
                                           kSOQuestionAnswerCount : @10,
                                           kSOQuestionScore : @1090,
                                           kSOQuestionCreationDate : @1340805096,
                                           kSOQuestionLink : @"http://stackoverflow.com/questions/11227809/why-is-processing-a-sorted-array-faster-than-an-unsorted-array",
                                           kSOQuestionTitle : @"Why is processing a sorted array faster than an unsorted array?",
                                           kSOQuestionTags : @[
                                                    @"java", @"c++", @"performance"
                                                   ],
                                           kSOQuestionViewsCount : @9000,
                                           kSOQuestionOwner : @{
                                                   kSOUserReputation : @139668,
                                                   kSOUserID : @87234,
                                                   kSOUserPicture : @"http://i.stack.imgur.com/FkjBe.png?s=128&g=1",
                                                   kSOUserName : @"GManNickG",
                                                   kSOUserPermalink : @"http://stackoverflow.com/users/87234/gmannickg"
                                                   }
                                           };
    
        SOQuestion *modelObject = [[SOQuestion alloc] initWithDictionary:mockedDictionary];
        
        [[@(modelObject.answerCount) should] equal:@10];
        [[@(modelObject.score) should] equal:@1090];
        [[modelObject.creationDate should] equal:[[NSDate alloc] initWithTimeIntervalSince1970:1340805096]];
        [[modelObject.link should] equal:[NSURL URLWithString:@"http://stackoverflow.com/questions/11227809/why-is-processing-a-sorted-array-faster-than-an-unsorted-array"]];
        [[modelObject.title should] equal:@"Why is processing a sorted array faster than an unsorted array?"];
        [[@(modelObject.tags.count) should] equal:@3];
        [[@(modelObject.viewsCount) should] equal:@9000];
        [modelObject.owner shouldNotBeNil];
    });
    
    it(@"should not return nil if the dictionary is nil", ^{
        SOQuestion *modelObject = [[SOQuestion alloc] initWithDictionary:nil];
        [[modelObject shouldNot] beNil];
    });
});

SPEC_END