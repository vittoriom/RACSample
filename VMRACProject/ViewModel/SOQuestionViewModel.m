//
//  SOQuestionViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewModel.h"
#import "SOQuestion.h"
#import "SOHTTPRequestOperationManager.h"
#import "SOHotQuestionsOperation.h"

@interface SOQuestionViewModel ()

@end

@implementation SOQuestionViewModel

- (instancetype) initWithModel:(NSArray *)modelObject
{
    self = [self init];
    if(!self) return nil;
    
    self.model = modelObject;
    
    return self;
}

@end
