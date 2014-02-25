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
 
 @return The newly created view.
 */
+ (id)wta_autolayoutView;

///--------------------------------------------------
/// @name Edge and Spacing Constraints
///--------------------------------------------------

/**
 Creates a leading constraint to the current view with offset. The constraint is added the view's superview
 
 @param offset from the edge.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addLeadingConstraintToSuperviewOffset:(CGFloat)offset;

/**
 Creates a trailing constraint to the current view with offset. The constraint is added the view's superview. Positive offset moves the view to the right.
 
 @param offset from the edge.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addTrailingConstraintToSuperviewOffset:(CGFloat)offset;

/**
 Creates a top constraint to the current view with offset. The constraint is added the view's superview.
 
 @param offset from the edge.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addTopConstraintToSuperviewOffset:(CGFloat)offset;

/**
 Creates a bottom constraint to the current view with offset. The constraint is added the view's superview. Positive offset moves the view down.
 
 @param offset from the edge.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addBottomConstraintToSuperviewOffset:(CGFloat)offset;

/**
 Creates a leading constraint with a view related to a view with an offset. The constraint is added to the withView's superview.
 
 @param withView View that will be effected by the constraint.
 @param toView View that the constraint is related to.
 @param offset between the withView and toView.
 @return The newly added constraint.
 */
+ (NSLayoutConstraint *)wta_addLeadingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

/**
 Creates a trailing constraint with a view related to a view with an offset. The constraint is added to the withView's superview.
 
 @param withView View that will be effected by the constraint.
 @param toView View that the constraint is related to.
 @param offset from the edge.
 @return The newly added constraint.
 */
+ (NSLayoutConstraint *)wta_addTrailingConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

/**
 Creates a top constraint with a view related to a view with an offset. The constraint is added to the withView's superview.
 
 @param withView View that will be effected by the constraint.
 @param toView View that the constraint is related to.
 @param offset between the withView and toView.
 @return The newly added constraint.
 */
+ (NSLayoutConstraint *)wta_addTopConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

/**
 Creates a bottom constraint with a view related to a view with an offset. The constraint is added to the withView's superview.
 
 @param withView View that will be effected by the constraint.
 @param toView View that the constraint is related to.
 @param offset between the withView and toView.
 @return The newly added constraint.
 */
+ (NSLayoutConstraint *)wta_addBottomConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

///--------------------------------------------------
/// @name Centering Constraints
///--------------------------------------------------

/**
 Creates a constraint to vertically center the current view. The constraint is added to the view's superview.
 
 @param offset to move the view vertically from the center.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addVerticallyCenterConstraintToSuperviewOffset:(CGFloat)offset;

/**
 Creates a constraint to horizontally center the current view. The constraint is added to the view's superview.
 
 @param offset to move the view horizontally from the center.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addHorizontallyCenterConstraintToSuperviewOffset:(CGFloat)offset;

/**
 Creates a constraint to vertically center a view to a view. The constraint is added to the withView's superview.
 
 @param withView the view to be centered
 @param toView the view that the withView will be centered in relation to.
 @param offset to move the view vertically from the center.
 @return The newly added constraint.
 */
+ (NSLayoutConstraint *)wta_addVerticallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

/**
 Creates a constraint to horizontally center a view to a view. The constraint is added to the withView's superview.
 
 @param withView the view to be centered
 @param toView the view that the withView will be centered in relation to.
 @param offset to move the view horizontally from the center.
 @return The newly added constraint.
 */
+ (NSLayoutConstraint *)wta_addHorizontallyCenterConstraintWithView:(UIView *)withView toView:(UIView *)toView offset:(CGFloat)offset;

///--------------------------------------------------
/// @name Size Constraints
///--------------------------------------------------

/**
 Adds a constraint to set the height of the current view.
 
 @param height of the view.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addHeightConstraint:(CGFloat)height;

/**
 Adds a constraint to set the width of the current view.
 
 @param width of the view.
 @return The newly added constraint.
 */
- (NSLayoutConstraint *)wta_addWidthConstraint:(CGFloat)width;

@end
