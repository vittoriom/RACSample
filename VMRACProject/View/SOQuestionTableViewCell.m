//
//  SOQuestionTableViewCell.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOQuestionTableViewCell.h"
#import "SOUser.h"

@implementation SOQuestionTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
		[RACObserve(self, modelObject) subscribeNext:^(SOQuestion *value) {
			self.textLabel.text = value.title;
			self.textLabel.numberOfLines = 2;
			self.textLabel.font = [UIFont systemFontOfSize:14.0];
			self.textLabel.minimumScaleFactor = 0.7;
			
			self.detailTextLabel.text = [NSString stringWithFormat:@"made by %@, %@ answers",value.owner.username, @(value.answerCount)];
			self.detailTextLabel.textColor = [UIColor darkGrayColor];
		}];
    }
    return self;
}

@end
