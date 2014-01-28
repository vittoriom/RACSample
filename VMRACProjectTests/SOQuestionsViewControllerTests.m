#import "SOQuestionsViewModel.h"
#import "SOQuestionsViewController.h"
#import "SOQuestion.h"

SPEC_BEGIN(SOQuestionsViewControllerTests)

describe(@"Questions view controller", ^{
    it(@"should be correctly created with a view model object", ^{
        SOQuestion *model = [SOQuestion new];
        SOQuestionsViewModel *viewModel = [[SOQuestionsViewModel alloc] initWithModel:@[model]];
        
        SOQuestionsViewController *viewController = [[SOQuestionsViewController alloc] initWithViewModel:viewModel];
        
        [[viewController.viewModel should] equal:viewModel];
    });
});

SPEC_END