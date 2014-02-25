//
//  UIView+WTAAutoLayoutHelpers.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/19/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "UIView+WTAAutoLayoutHelpers.h"
#import "NSLayoutConstraint+WTAAutoLayoutHelpers.h"

@implementation UIView (WTAAutoLayoutHelpers)

#pragma mark - Convenience Constructors

+ (id)wta_autolayoutView;
{
    id view = [self new];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    return view;
}

#pragma mark - Convenience Methods for Common Constraints

- (NSArray *)wta_addEdgeConstraintsToSuperview:(UIEdgeInsets)inset
{
    NSLayoutConstraint *topConstraint = [self wta_addTopConstraintToSuperviewOffset:inset.top];
    NSLayoutConstraint *leadingConstraint = [self wta_addLeadingConstraintToSuperviewOffset:inset.left];
    
    // Bottom and right insets are negated because constants in autolayout are always positive to the right down.
    NSLayoutConstraint *bottomConstraint = [self wta_addBottomConstraintToSuperviewOffset:-inset.bottom];
    NSLayoutConstraint *trailingConstraint = [self wta_addTrailingConstraintToSuperviewOffset:-inset.right];
    
    return @[topConstraint, leadingConstraint, bottomConstraint, trailingConstraint];
}

- (NSLayoutConstraint *)wta_addLeadingConstraintToSuperviewOffset:(CGFloat)offset
{
    return [UIView wta_addLeadingConstraintWithView:self toView:[self superview] offset:offset];
}

- (NSLayoutConstraint *)wta_addTrailingConstraintToSuperviewOffset:(CGFloat)offset
{
    return [UIView wta_addTrailingConstraintWithView:self toView:[self superview] offset:offset];
}

- (NSLayoutConstraint *)wta_addTopConstraintToSuperviewOffset:(CGFloat)offset
{
    return [UIView wta_addTopConstraintWithView:self toView:[self superview] offset:offset];
}

- (NSLayoutConstraint *)wta_addBottomConstraintToSuperviewOffset:(CGFloat)offset
{
    return [UIView wta_addBottomConstraintWithView:self toView:[self superview] offset:offset];
}

+ (NSLayoutConstraint *)wta_addLeadingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_leadingConstraintWithView:withView toView:toView offset:offset];
    [[withView superview] addConstraint:constraint];
    return constraint;
}

+ (NSLayoutConstraint *)wta_addTrailingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_trailingConstraintWithView:withView toView:toView offset:offset];
    [[withView superview] addConstraint:constraint];
    return constraint;
}

+ (NSLayoutConstraint *)wta_addTopConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_topConstraintWithView:withView toView:toView offset:offset];
    [[withView superview] addConstraint:constraint];
    return constraint;
}

+ (NSLayoutConstraint *)wta_addBottomConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_bottomConstraintWithView:withView toView:toView offset:offset];
    [[withView superview] addConstraint:constraint];
    return constraint;
}

#pragma mark - Centering Constraints

- (NSLayoutConstraint *)wta_addVerticallyCenterConstraintToSuperviewOffset:(CGFloat)offset
{
    return [UIView wta_addVerticallyCenterConstraintWithView:self toView:[self superview] offset:offset];
}

- (NSLayoutConstraint *)wta_addHorizontallyCenterConstraintToSuperviewOffset:(CGFloat)offset
{
    return [UIView wta_addHorizontallyCenterConstraintWithView:self toView:[self superview] offset:offset];
}

+ (NSLayoutConstraint *)wta_addHorizontallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_horizontallyCenterConstraintWithView:withView
                                                                                           toView:toView
                                                                                           offset:offset];
    [[withView superview] addConstraint:constraint];
    return constraint;
}

+ (NSLayoutConstraint *)wta_addVerticallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_verticallyCenterConstraintWithView:withView
                                                                                         toView:toView
                                                                                         offset:offset];
    [[withView superview] addConstraint:constraint];
    return constraint;
}

#pragma mark - Size Constraints

- (NSArray *)wta_addSizeConstraints:(CGSize)size
{
    NSLayoutConstraint *widthConstraint = [self wta_addWidthConstraint:size.width];
    NSLayoutConstraint *heightConstraint = [self wta_addHeightConstraint:size.height];
    return @[widthConstraint, heightConstraint];
}

- (NSLayoutConstraint *)wta_addHeightConstraint:(CGFloat)height
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_heightConstraintWithView:self
                                                                               height:height];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)wta_addWidthConstraint:(CGFloat)width
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_widthConstraintWithView:self
                                                                               width:width];
    
    [self addConstraint:constraint];
    return constraint;
}

@end
