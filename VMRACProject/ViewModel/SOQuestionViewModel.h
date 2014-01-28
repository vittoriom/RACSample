//
//  SOQuestionViewModel.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "RVMViewModel.h"

@class SOQuestion;

@interface SOQuestionViewModel : RVMViewModel

@property (nonatomic, readonly) SOQuestion *model;
@property (nonatomic, readonly) NSArray *answers;

- (instancetype) initWithModel:(SOQuestion *)modelObject;
- (RACSignal *) loadAnswers;

@end
