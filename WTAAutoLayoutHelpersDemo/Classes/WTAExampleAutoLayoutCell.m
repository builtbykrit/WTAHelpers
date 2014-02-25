//
//  WTAExampleAutoLayoutCell.m
//  WTAHelpers
//
//  Created by Trung Tran on 2/25/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTAExampleAutoLayoutCell.h"

@implementation WTAExampleAutoLayoutCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)prepareForReuse
{
    [[[self parentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
