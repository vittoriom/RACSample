//
//  SOQuestionViewModel.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "RVMViewModel.h"

@class SOQuestion;

@interface SOQuestionViewModel : RVMViewModel

@property (nonatomic, readonly) NSArray *model;

- (instancetype) initWithModel:(NSArray *)modelObject;

@end
