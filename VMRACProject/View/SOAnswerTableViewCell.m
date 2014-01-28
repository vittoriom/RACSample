//
//  SOAnswerTableViewCell.m
//  VMRACProject
//
//  Created by Vittorio Monaco on 28/01/14.
//  Copyright (c) 2014 Vittorio Monaco. All rights reserved.
//

#import "SOAnswerTableViewCell.h"
#import "SOAnswer.h"
#import "NSString+HTML.h"
#import "NSDate+HumanInterval.h"
#import "SOUser.h"

@implementation SOAnswerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
		[RACObserve(self, modelObject) subscribeNext:^(SOAnswer *value) {
			self.textLabel.text = [value.body stringByDecodingHTMLEntities];
			self.textLabel.numberOfLines = 2;
			self.textLabel.font = [UIFont systemFontOfSize:14.0];
			self.textLabel.minimumScaleFactor = 0.7;
			
			self.detailTextLabel.text = [NSString stringWithFormat:@"made by %@ %@",[value.owner.username stringByDecodingHTMLEntities], [value.creationDate humanIntervalAgoSinceNow]];
			self.detailTextLabel.textColor = [UIColor darkGrayColor];
		}];
    }
    return self;
}

@end
