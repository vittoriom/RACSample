//
//  SOQuestionViewModel.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionViewModel.h"
#import "SOQuestion.h"

@interface SOQuestionViewModel ()

@property (nonatomic, strong) SOQuestion *model;

@end

@implementation SOQuestionViewModel

- (instancetype) initWithModel:(SOQuestion *)modelObject
{
	self = [super init];
	if(!self) return nil;
	
	self.model = modelObject;
	
	[self.didBecomeActiveSignal subscribeNext:^(id x) {
		
	}];
	
	return self;
}

@end
