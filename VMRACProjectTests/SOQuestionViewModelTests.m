#import "SOQuestion.h"
#import "SOQuestionViewModel.h"

SPEC_BEGIN(SOQuestionViewModelTest)

describe(@"Question view model", ^{
	it(@"should be correctly initialized with a SOQuestion model object", ^{
		SOQuestion *modelObject = [SOQuestion new];
		SOQuestionViewModel *viewModel = [[SOQuestionViewModel alloc] initWithModel:modelObject];
		
		[[viewModel shouldNot] beNil];
		[[viewModel.model should] equal:modelObject];
	});
});

SPEC_END