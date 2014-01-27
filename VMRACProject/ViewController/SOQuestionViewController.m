//
//  SOQuestionViewController.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewController.h"
#import "SOQuestionViewModel.h"

@interface SOQuestionViewController ()

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
    
    self.viewModel.active = YES;
}

@end
