//
//  UIView+WTAAutoLayoutHelpers.h
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/19/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WTAAutoLayoutHelpers)

+ (id)wta_autolayoutView;
- (void)wta_addLeadingConstraintForSuperviewOffset:(CGFloat)offset;
- (void)wta_addTrailingConstraintForSuperviewOffset:(CGFloat)offset;
- (void)wta_addTopConstraintForSuperviewOffset:(CGFloat)offset;
- (void)wta_addBottomConstraintForSuperviewOffset:(CGFloat)offset;
- (void)wta_addHeightConstraint:(CGFloat)height;
- (void)wta_addWidthConstraint:(CGFloat)width;

@end
