//
//  NSLayoutConstraint+WTAAutoLayoutHelpers.h
//  WTAHelpers
//
//  Created by Trung Tran on 2/25/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (WTAAutoLayoutHelpers)

///--------------------------------------------------
/// @name Convenience Methods for Edge Constraints
///--------------------------------------------------

+ (NSLayoutConstraint *)wta_leadingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_trailingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_topConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_bottomConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

///--------------------------------------------------
/// @name Convenience Methods for Centering Constraints
///--------------------------------------------------

+ (NSLayoutConstraint *)wta_horizontallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_verticallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

///--------------------------------------------------
/// @name Convenience Methods for Size Constraints
///--------------------------------------------------

+ (NSLayoutConstraint *)wta_heightConstraintWithView:(UIView *)view height:(CGFloat)height;
+ (NSLayoutConstraint *)wta_widthConstraintWithView:(UIView *)view width:(CGFloat)width;

@end
