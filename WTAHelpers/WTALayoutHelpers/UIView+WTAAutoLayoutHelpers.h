//
//  UIView+WTAAutoLayoutHelpers.h
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/19/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WTAAutoLayoutHelpers)

///---------------------------------
/// @name Convenience Constructors
///---------------------------------

/**
 Method to create a view with translatesAutoresizingMasks set to NO. 
 
 @return A newly created view.
 */
+ (id)wta_autolayoutView;

///--------------------------------------------------
/// @name Convenience Methods for Common Constraints
///--------------------------------------------------

- (NSLayoutConstraint *)wta_addLeadingConstraintToSuperviewOffset:(CGFloat)offset;
- (NSLayoutConstraint *)wta_addTrailingConstraintToSuperviewOffset:(CGFloat)offset;
- (NSLayoutConstraint *)wta_addTopConstraintToSuperviewOffset:(CGFloat)offset;
- (NSLayoutConstraint *)wta_addBottomConstraintToSuperviewOffset:(CGFloat)offset;

+ (NSLayoutConstraint *)wta_addLeadingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_addTrailingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_addTopConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_addBottomConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

///--------------------------------------------------
/// @name Convenience Methods for Common Constraints
///--------------------------------------------------

- (NSLayoutConstraint *)wta_addVerticallyCenterConstraintToSuperviewOffset:(CGFloat)offset;
- (NSLayoutConstraint *)wta_addHorizontallyCenterConstraintToSuperviewOffset:(CGFloat)offset;

+ (NSLayoutConstraint *)wta_addVerticallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;
+ (NSLayoutConstraint *)wta_addHorizontallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

///--------------------------------------------------
/// @name Convenience Methods for Common Constraints
///--------------------------------------------------

- (NSLayoutConstraint *)wta_addHeightConstraint:(CGFloat)height;
- (NSLayoutConstraint *)wta_addWidthConstraint:(CGFloat)width;

@end
