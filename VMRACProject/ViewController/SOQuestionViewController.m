//
//  SOQuestionViewController.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewController.h"
#import "SOQuestion.h"
#import "SOQuestionViewModel.h"
#import "SOQuestionTableViewCell.h"

@interface SOQuestionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SOQuestionViewModel *viewModel;

@end

@implementation SOQuestionViewController

- (instancetype) initWithViewModel:(SOQuestionViewModel *)viewModelObject
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
