//
//  SOQuestionViewController.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SOQuestionViewModel;

@interface SOQuestionViewController : UIViewController

@property (nonatomic, readonly) SOQuestionViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (instancetype) initWithViewModel:(SOQuestionViewModel *)viewModelObject;

@end
