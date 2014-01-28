//
//  SOQuestionViewController.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

@class SOQuestionViewModel;

@interface SOQuestionViewController : UIViewController

@property (nonatomic, readonly) SOQuestionViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *questionTitle;
@property (weak, nonatomic) IBOutlet UILabel *questionUser;
@property (weak, nonatomic) IBOutlet UILabel *questionAnswers;
@property (weak, nonatomic) IBOutlet UILabel *questionCreationDate;

- (instancetype) initWithViewModel:(SOQuestionViewModel *)viewModelObject;

@end
