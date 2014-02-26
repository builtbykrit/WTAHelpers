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

#pragma mark - Edge Constraints to Superview

- (NSArray *)wta_addEdgeConstraintsToSuperview:(UIEdgeInsets)inset
{
    NSLayoutConstraint *topConstraint = [self wta_addTopConstraintToSuperviewOffset:inset.top];
    NSLayoutConstraint *leadingConstraint = [self wta_addLeadingConstraintToSuperviewOffset:inset.left];
    
    // Bottom and right insets are negated because constants in autolayout are always positive to the right down.
    NSLayoutConstraint *bottomConstraint = [self wta_addBottomConstraintToSuperviewOffset:inset.bottom];
    NSLayoutConstraint *trailingConstraint = [self wta_addTrailingConstraintToSuperviewOffset:inset.right];
    
    return @[topConstraint, leadingConstraint, bottomConstraint, trailingConstraint];
}

- (NSLayoutConstraint *)wta_addLeadingConstraintToSuperviewOffset:(CGFloat)offset
{
    return [self wta_addLeadingConstraintToView:[self superview] offset:offset];
}

- (NSLayoutConstraint *)wta_addTrailingConstraintToSuperviewOffset:(CGFloat)offset
{
    return [self wta_addTrailingConstraintToView:[self superview] offset:offset];
}

- (NSLayoutConstraint *)wta_addTopConstraintToSuperviewOffset:(CGFloat)offset
{
    return [self wta_addTopConstraintToView:[self superview] offset:offset];
}

- (NSLayoutConstraint *)wta_addBottomConstraintToSuperviewOffset:(CGFloat)offset
{
    return [self wta_addBottomConstraintToView:[self superview] offset:offset];
}

#pragma mark - Align Edges for Sibling Views

- (NSLayoutConstraint *)wta_addLeadingConstraintToView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_leadingConstraintWithView:self toView:toView offset:offset];
    [[self superview] addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)wta_addTrailingConstraintToView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_trailingConstraintWithView:self toView:toView offset:offset];
    [[self superview] addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)wta_addTopConstraintToView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_topConstraintWithView:self toView:toView offset:offset];
    [[self superview] addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)wta_addBottomConstraintToView:(UIView *)toView offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_bottomConstraintWithView:self toView:toView offset:offset];
    [[self superview] addConstraint:constraint];
    return constraint;
}

#pragma mark - Placing Sibling Views Adjacent to Eachother

- (NSLayoutConstraint *)wta_addConstraintPlacingViewRightOfView:(UIView *)view
{
    return [self wta_addConstraintPlacingViewRightOfView:view separation:0.0];
}

- (NSLayoutConstraint *)wta_addConstraintPlacingViewRightOfView:(UIView *)view separation:(CGFloat)separation;
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_trailingToLeadingConstraintWithTrailingView:self
                                                                                             leadingView:view
                                                                                              separation:separation];
    [[self superview] addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)wta_addConstraintPlacingViewLeftOfView:(UIView *)view
{
    return [self wta_addConstraintPlacingViewLeftOfView:view separation:0.0];
}

- (NSLayoutConstraint *)wta_addConstraintPlacingViewLeftOfView:(UIView *)view separation:(CGFloat)separation;
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_trailingToLeadingConstraintWithTrailingView:view
                                                                                             leadingView:self
                                                                                              separation:separation];
    [[self superview] addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)wta_addConstraintPlacingViewAboveView:(UIView *)view
{
    return [self wta_addConstraintPlacingViewAboveView:view separation:0.0];
}

- (NSLayoutConstraint *)wta_addConstraintPlacingViewAboveView:(UIView *)view separation:(CGFloat)separation;
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_bottomToTopConstraintWithTopView:self
                                                                                   bottomView:view
                                                                                   separation:separation];
    [[self superview] addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)wta_addConstraintPlacingViewBelowView:(UIView *)view
{
    return [self wta_addConstraintPlacingViewBelowView:view separation:0.0];
}

- (NSLayoutConstraint *)wta_addConstraintPlacingViewBelowView:(UIView *)view separation:(CGFloat)separation
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint wta_bottomToTopConstraintWithTopView:view
                                                                                   bottomView:self
                                                                                   separation:separation];
    [[self superview] addConstraint:constraint];
    return constraint;
}

#pragma mark - Centering Constraints

- (NSArray *)wta_addCenteringConstraintToSuperview
{
    return [self wta_addCenteringConstraintToSuperviewOffset:CGPointZero];
}

- (NSArray *)wta_addCenteringConstraintToSuperviewOffset:(CGPoint)offset
{
    NSLayoutConstraint *verticalConstraint = [self wta_addVerticallyCenterConstraintToSuperviewOffset:offset.y];
    NSLayoutConstraint *horizontalConstraint = [self wta_addHorizontallyCenterConstraintToSuperviewOffset:offset.x];
    return @[verticalConstraint, horizontalConstraint];
}

- (NSLayoutConstraint *)wta_addVerticallyCenterConstraintToSuperview
{
    return [self wta_addVerticallyCenterConstraintToSuperviewOffset:0.0];
}

- (NSLayoutConstraint *)wta_addHorizontallyCenterConstraintToSuperview
{
    return [self wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
}

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
