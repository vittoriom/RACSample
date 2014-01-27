#import "SOQuestionViewModel.h"
#import "SOQuestionViewController.h"
#import "SOQuestion.h"

SPEC_BEGIN(SOQuestionsViewControllerTests)

describe(@"Questions view controller", ^{
    it(@"should be correctly created with a view model object", ^{
        SOQuestion *model = [SOQuestion new];
        SOQuestionViewModel *viewModel = [[SOQuestionViewModel alloc] initWithModel:@[model]];
        
        SOQuestionViewController *viewController = [[SOQuestionViewController alloc] initWithViewModel:viewModel];
        
        [[viewController.viewModel should] equal:viewModel];
    });
});

SPEC_END