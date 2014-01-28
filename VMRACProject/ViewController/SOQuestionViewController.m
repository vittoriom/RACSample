//
//  SOQuestionViewController.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewController.h"
#import "SOAnswer.h"
#import "SOQuestionViewModel.h"
#import "SOQuestion.h"
#import "SOAnswerTableViewCell.h"
#import "SOUser.h"
#import "NSDate+HumanInterval.h"

@interface SOQuestionViewController () <UITableViewDataSource, UITableViewDelegate>

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
	self.questionAnswersTable.dataSource = self;
	self.questionAnswersTable.delegate = self;
	
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

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.viewModel.answers.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SOAnswerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SOAnswerCell"] ?:
	[[SOAnswerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SOAnswerCell"];;
	
	cell.modelObject = self.viewModel.answers[indexPath.row];
	
	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SOAnswer *modelObject = self.viewModel.answers[indexPath.row];
	
	CGFloat height = [modelObject.body sizeWithFont:[UIFont systemFontOfSize:12.0] constrainedToSize:CGSizeMake(320, 10000)].height + 50;
	return height;
}

@end
