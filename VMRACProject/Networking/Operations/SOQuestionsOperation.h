//
//  SOQuestionsOperation.h
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "AFHTTPRequestOperation.h"

@interface SOQuestionsOperation : AFHTTPRequestOperation

- (instancetype) initWithPage:(NSUInteger)pageNumber withPageSize:(NSUInteger)pageSize sortedBy:(NSString *)sort;

@end
