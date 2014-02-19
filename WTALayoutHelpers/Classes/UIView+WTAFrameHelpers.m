//
//  UIView+WTAFrameHelpers.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/18/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "UIView+WTAFrameHelpers.h"

@implementation UIView (WTAFrameHelpers)

#pragma mark - Convenience Frame Getters

- (CGSize)wta_frameSize
{
    CGRect frame = [self frame];
    return frame.size;
}

- (CGFloat)wta_frameSizeWidth
{
    CGRect frame = [self frame];
    return frame.size.width;
}

- (CGFloat)wta_frameSizeHeight
{
    CGRect frame = [self frame];
    return frame.size.height;
}

- (CGPoint)wta_frameOrigin
{
    CGRect frame = [self frame];
    return frame.origin;
}

- (CGFloat)wta_frameOriginX
{
    CGRect frame = [self frame];
    return frame.origin.x;
}

- (CGFloat)wta_frameOriginY
{
    CGRect frame = [self frame];
    return frame.origin.y;
}

#pragma mark - Convenience Frame Setters

- (void)wta_setFrameSize:(CGSize)size
{
    CGRect frame = [self frame];
    frame.size = size;
    [self setFrame:frame];
}

- (void)wta_setFrameSizeHeight:(CGFloat)height
{
    CGRect frame = [self frame];
    frame.size.height = height;
    [self setFrame:frame];
}

- (void)wta_setFrameSizeWidth:(CGFloat)width
{
    CGRect frame = [self frame];
    frame.size.width = width;
    [self setFrame:frame];
}

- (void)wta_setFrameOrigin:(CGPoint)origin
{
    CGRect frame = [self frame];
    frame.origin = origin;
    [self setFrame:frame];
}

- (void)wta_setFrameOriginX:(CGFloat)x
{
    CGRect frame = [self frame];
    frame.origin.x = x;
    [self setFrame:frame];
}

- (void)wta_setFrameOriginY:(CGFloat)y
{
    CGRect frame = [self frame];
    frame.origin.y = y;
    [self setFrame:frame];
}

#pragma mark - Convenience Objective-C CGRectGet* Methods

- (CGFloat)wta_frameMinX
{
    CGRect frame = [self frame];
    return CGRectGetMinX(frame);
}

- (CGFloat)wta_frameMinY
{
    CGRect frame = [self frame];
    return CGRectGetMinY(frame);
}

- (CGFloat)wta_frameMidX
{
    CGRect frame = [self frame];
    return CGRectGetMidX(frame);
}

- (CGFloat)wta_frameMidY
{
    CGRect frame = [self frame];
    return CGRectGetMidY(frame);
}

- (CGFloat)wta_frameMaxX
{
    CGRect frame = [self frame];
    return CGRectGetMaxX(frame);
}

- (CGFloat)wta_frameMaxY
{
    CGRect frame = [self frame];
    return CGRectGetMaxY(frame);
}

#pragma mark - Edge Alignment Methods For a Given View

- (void)wta_topAlignInView:(UIView *)view
{

}

- (void)wta_leftAlignInView:(UIView *)view
{

}

- (void)wta_bottomAlignInView:(UIView *)view
{

}

- (void)wta_rightAlignInView:(UIView *)view
{
    
}

- (void)wta_topAlignInView:(UIView *)view offset:(CGFloat)offset
{
    [self wta_setFrameOriginY:offset];
}

- (void)wta_leftAlignInView:(UIView *)view offset:(CGFloat)offset
{
    [self wta_setFrameOriginX:offset];
}

- (void)wta_bottomAlignInView:(UIView *)view offset:(CGFloat)offset
{
    CGFloat y = [view wta_frameSizeHeight] - [self wta_frameSizeHeight] - offset;
    [self wta_setFrameOriginY:y];
}

- (void)wta_rightAlignInView:(UIView *)view offset:(CGFloat)offset
{
    CGFloat x = [view wta_frameSizeWidth] - [self wta_frameSizeWidth] - offset;
    [self wta_setFrameOriginX:x];
}

#pragma mark - Edge Alignment Methods For Superview

- (void)wta_topAlignInSuperview
{
    
}

- (void)wta_leftAlignInSuperview
{
    
}

- (void)wta_bottomAlignInSuperview
{
    
}

- (void)wta_rightAlignInSuperview
{
    
}

- (void)wta_topAlignInSuperviewOffset:(CGFloat)offset
{
    
}

- (void)wta_leftAlignInSuperviewOffset:(CGFloat)offset
{
    
}

- (void)wta_bottomAlignInSuperviewOffset:(CGFloat)offset
{
    
}

- (void)wta_rightAlignInSuperviewOffset:(CGFloat)offset
{
    
}

#pragma mark - Centering Methods in a View

- (void)wta_centerAlignInView:(UIView *)view
{
    
}

- (void)wta_centerAlignVerticallyInView:(UIView *)view
{
    
}

- (void)wta_centerAlignHorizontallyInView:(UIView *)view
{
    
}

- (void)wta_centerAlignInView:(UIView *)view offset:(CGPoint)offset
{
    
}

- (void)wta_centerAlignVerticallyInView:(UIView *)view offset:(CGFloat)offset
{
    
}

- (void)wta_centerAlignHorizontallyInView:(UIView *)view offset:(CGFloat)offset
{
    
}

#pragma mark - Centering Methods in its Superview

- (void)wta_centerAlignInSuperview
{
    
}

- (void)wta_centerAlignVerticallyInSuperview
{
    
}

- (void)wta_centerAlignHorizontallyInSuperview
{
    
}

- (void)wta_centerAlignInSuperviewOffset:(CGFloat)offset
{
    
}

- (void)wta_centerAlignVerticallyInSuperviewOffset:(CGFloat)offset
{
    
}

- (void)wta_centerAlignHorizontallyInSuperviewOffset:(CGFloat)offset
{
    
}

@end
