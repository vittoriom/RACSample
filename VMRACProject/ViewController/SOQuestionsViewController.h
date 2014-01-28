//
//  SOQuestionViewController.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SOQuestionsViewModel;

@interface SOQuestionsViewController : UIViewController

@property (nonatomic, readonly) SOQuestionsViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (instancetype) initWithViewModel:(SOQuestionsViewModel *)viewModelObject;

@end
