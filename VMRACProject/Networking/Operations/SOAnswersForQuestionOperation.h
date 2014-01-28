//
//  SOAnswersForQuestion.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "AFHTTPRequestOperation.h"

@interface SOAnswersForQuestionOperation : AFHTTPRequestOperation

- (instancetype) initWithQuestionID:(NSString *)questionID;

@end
