//
//  SOQuestionViewController.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewController.h"
#import "SOQuestionViewModel.h"
#import "SOQuestion.h"
#import "SOUser.h"
#import "NSDate+HumanInterval.h"

@interface SOQuestionViewController ()

@property (nonatomic, strong) SOQuestionViewModel *viewModel;

@end

@implementation SOQuestionViewController

- (instancetype) initWithViewModel:(SOQuestionViewModel *)viewModelObject
{
	self = [super initWithNibName:@"SOQuestionView" bundle:nil];
	if(!self) return nil;
	
	self.viewModel = viewModelObject;
	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//Load data
	@weakify(self);
	[[[RACObserve(self.viewModel, model) ignore:nil] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(SOQuestion *question) {
		@strongify(self);
		self.questionTitle.text = question.title;
		self.questionUser.text = [NSString stringWithFormat:@"Made by %@",question.owner.username];
		self.questionCreationDate.text = [question.creationDate humanIntervalAgoSinceNow];
		self.questionAnswers.text = [NSString stringWithFormat:@"%d answers",question.answerCount];
		
		[[self.viewModel loadAnswers] subscribeCompleted:^{
			[self.questionAnswersTable reloadData];
		}];
	}];
}

@end
