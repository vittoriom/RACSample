//
//  SOQuestionViewController.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionsViewController.h"
#import "SOQuestion.h"
#import "SOQuestionsViewModel.h"
#import "SOQuestionTableViewCell.h"
#import <RACDelegateProxy.h>

@interface SOQuestionsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SOQuestionsViewModel *viewModel;
@property (nonatomic, strong) id<UITableViewDelegate> tableViewDelegate;

@end

@implementation SOQuestionsViewController

- (instancetype) initWithViewModel:(SOQuestionsViewModel *)viewModelObject
{
    self = [self initWithNibName:@"SOQuestionView" bundle:nil];
    if(!self) return nil;
    
    self.viewModel = viewModelObject;
	
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.tableView.dataSource = self;
	
	RACDelegateProxy *delegate = [[RACDelegateProxy alloc] initWithProtocol:@protocol(UITableViewDelegate)];
	[[delegate rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)] subscribeNext:^(RACTuple *tuple) {
		NSIndexPath *indexPath = tuple.second;
		SOQuestion *modelObject = self.viewModel.model[indexPath.row];
		
		//Show the question view controller
		NSLog(@"tapped question: %@",modelObject);
	}];
	
	self.tableViewDelegate = (id<UITableViewDelegate>)delegate;
	self.tableView.delegate = (id<UITableViewDelegate>)delegate;
	
	@weakify(self);
	[[RACObserve(self.viewModel, model) ignore:nil] subscribeNext:^(NSArray *x) {
		@strongify(self);
		
		[self.tableView reloadData];
	}];
	
    self.viewModel.active = YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.viewModel.model.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SOQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SOQuestionCell"] ?:
									[[SOQuestionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SOQuestionCell"];;
		
	cell.modelObject = self.viewModel.model[indexPath.row];
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
}

@end
