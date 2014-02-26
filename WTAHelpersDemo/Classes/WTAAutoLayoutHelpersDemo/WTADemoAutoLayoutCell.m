//
//  WTAExampleAutoLayoutCell.m
//  WTAHelpers
//
//  Created by Trung Tran on 2/25/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTADemoAutoLayoutCell.h"

@implementation WTADemoAutoLayoutCell

- (void)prepareForReuse
{
    [[[self parentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
