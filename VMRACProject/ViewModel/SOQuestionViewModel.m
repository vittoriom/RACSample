//
//  SOQuestionViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 27/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewModel.h"
#import "SOQuestion.h"

@interface SOQuestionViewModel ()

@property (nonatomic, strong) NSArray *model;

@end

@implementation SOQuestionViewModel

- (instancetype) initWithModel:(NSArray *)modelObject
{
    self = [self init];
    if(!self) return nil;
    
    self.model = modelObject;
    
    @weakify(self);
    [self.didBecomeActiveSignal subscribeNext:^(id x) {
        @strongify(self);
        
        NSLog(@"Active");
        //If our model object is empty, we load hot questions
        if(modelObject.count == 0)
        {
            
        } else
        {
            
        }
    }];
    
    
    return self;
}

@end
