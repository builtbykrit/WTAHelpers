//
//  UIView+WTANibLoading.h
//  WTAHelpers
//
//  Created by Matt Yohe on 2/25/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WTANibLoading)

+ (UINib *)wta_nibNamed:(NSString *)nibName;
+ (UINib *)wta_nib;
+ (instancetype)wta_loadInstanceWithNib:(UINib *)nib;
+ (instancetype)wta_loadInstanceFromNib;

@end
