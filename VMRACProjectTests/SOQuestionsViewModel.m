#import "SOQuestion.h"
#import "SOQuestionViewModel.h"

SPEC_BEGIN(SOQuestionsViewModelTests)

describe(@"Questions view model", ^{
    it(@"Should be correctly initialized with a SOQuestion NSArray model object", ^{
        SOQuestion *modelObject = [SOQuestion new];
        SOQuestionViewModel *viewModel = [[SOQuestionViewModel alloc] initWithModel:@[modelObject]];
        
        [[viewModel shouldNot] beNil];
        [[viewModel.model should] haveCountOf:1];
        [[viewModel.model[0] should] equal:modelObject];
    });
});

SPEC_END