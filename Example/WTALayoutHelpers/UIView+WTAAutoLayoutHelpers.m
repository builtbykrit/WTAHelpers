//
//  UIView+WTAAutoLayoutHelpers.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/19/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "UIView+WTAAutoLayoutHelpers.h"

@implementation UIView (WTAAutoLayoutHelpers)

+ (id)wta_autolayoutView;
{
    UIView *view = [UIView new];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    return view;
}

- (void)wta_addLeadingConstraintForSuperviewOffset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:[self superview]
                                                                  attribute:NSLayoutAttributeLeading
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    [[self superview] addConstraint:constraint];
}

- (void)wta_addTrailingConstraintForSuperviewOffset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:[self superview]
                                                                  attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    [[self superview] addConstraint:constraint];
}

- (void)wta_addTopConstraintForSuperviewOffset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:[self superview]
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    [[self superview] addConstraint:constraint];
}

- (void)wta_addBottomConstraintForSuperviewOffset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:[self superview]
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    [[self superview] addConstraint:constraint];
}

- (void)wta_addHeightConstraint:(CGFloat)height
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:height];
    
    [self addConstraint:constraint];
}

- (void)wta_addWidthConstraint:(CGFloat)width
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:width];
    
    [self addConstraint:constraint];
}

@end
