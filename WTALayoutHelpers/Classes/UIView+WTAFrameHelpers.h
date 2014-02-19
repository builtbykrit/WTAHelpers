//
//  UIView+WTAFrameHelpers.h
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/18/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 WTAFrameHelpers provides convenience methods for view placement and frame information.
 */
@interface UIView (WTAFrameHelpers)

///---------------------------------------------
/// @name Convenience Frame Getters
///---------------------------------------------

/**
 @return The frame size of the view.
 */
- (CGSize)wta_frameSize;

/**
 @return The frame width the view.
 */
- (CGFloat)wta_frameSizeWidth;

/**
 @return The frame height of the view.
 */
- (CGFloat)wta_frameSizeHeight;

/**
 @return The frame origin of the view.
 */
- (CGPoint)wta_frameOrigin;

/**
 @return The frame origin x of the view.
 */
- (CGFloat)wta_frameOriginX;

/**
 @return The frame origin y of the view.
 */
- (CGFloat)wta_frameOriginY;

///---------------------------------------------
/// @name Convenience Objective-C CGRectGet* Methods
///---------------------------------------------

/**
 This method replaces the need to use CGRectGetMinX(frame) on the view's frame.
 
 @return The frame minimum x of the view.
 */
- (CGFloat)wta_frameMinX;

/**
 This method replaces the need to use CGRectGetMinY(frame) on the view's frame.
 
 @return The frame minimum y of the view.
 */
- (CGFloat)wta_frameMinY;

/**
 This method replaces the need to use CGRectGetMidX(frame) on the view's frame.
 
 @return The frame minimum y of the view.
 */
- (CGFloat)wta_frameMidX;

/**
 This method replaces the need to use CGRectGetMidY(frame) on the view's frame.
 
 @return The frame minimum y of the view.
 */
- (CGFloat)wta_frameMidY;

/**
 This method replaces the need to use CGRectGetMaxX(frame) on the view's frame.
 
 @return The frame maximum x of the view.
 */
- (CGFloat)wta_frameMaxX;

/**
 This method replaces the need to use CGRectGetMaxY(frame) on the view's frame.
 
 @return The frame maximum y of the view.
 */
- (CGFloat)wta_frameMaxY;

///---------------------------------------------
/// @name Edge Alignment Methods
///---------------------------------------------

- (void)wta_leftAlignInView:(UIView *)view;
- (void)wta_rightAlignInView:(UIView *)view;
- (void)wta_topAlignInView:(UIView *)view;
- (void)wta_bottomAlignInView:(UIView *)view;

- (void)wta_leftAlignInSuperview;
- (void)wta_rightAlignInSuperview;
- (void)wta_topAlignInSuperview;
- (void)wta_bottomAlignInSuperview;

- (void)wta_leftAlignInView:(UIView *)view offset:(CGFloat)offset;
- (void)wta_rightAlignInView:(UIView *)view offset:(CGFloat)offset;
- (void)wta_topAlignInView:(UIView *)view offset:(CGFloat)offset;
- (void)wta_bottomAlignInView:(UIView *)view offset:(CGFloat)offset;

- (void)wta_leftAlignInSuperviewOffset:(CGFloat)offset;
- (void)wta_rightAlignInSuperviewOffset:(CGFloat)offset;
- (void)wta_topAlignInSuperviewOffset:(CGFloat)offset;
- (void)wta_bottomAlignInSuperviewOffset:(CGFloat)offset;

///---------------------------------------------
/// @name Centering Methods
///---------------------------------------------

- (void)wta_centerInSuperview;
- (void)wta_centerVerticallyInSuperview;
- (void)wta_centerHorizontallyInSuperview;

- (void)wta_centerInView:(UIView *)view;
- (void)wta_centerVerticallyInView:(UIView *)view;
- (void)wta_centerHorizontallyInView:(UIView *)view;

- (void)wta_centerInView:(UIView *)view offset:(CGPoint)offset;
- (void)wta_centerVerticallyInView:(UIView *)view offset:(CGFloat)offset;
- (void)wta_centerHorizontallyInView:(UIView *)view offset:(CGFloat)offset;

@end
