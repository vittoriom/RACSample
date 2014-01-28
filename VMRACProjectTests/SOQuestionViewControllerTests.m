#import "SOQuestion.h"
#import "SOQuestionViewModel.h"
#import "SOQuestionViewController.h"

SPEC_BEGIN(SOQuestionViewControllerTests)

describe(@"Question view controller", ^{
	it(@"should be correctly created with a view model object", ^{
		SOQuestion *modelObject = [SOQuestion new];
		SOQuestionViewModel *viewModel = [[SOQuestionViewModel alloc] initWithModel:modelObject];
		
		SOQuestionViewController *viewController = [[SOQuestionViewController alloc] initWithViewModel:viewModel];
		
		[[viewController shouldNot] beNil];
		[[viewController.viewModel should] equal:viewModel];
	});
});

SPEC_END