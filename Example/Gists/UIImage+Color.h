//
//  UIImage+Color.h
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//
//

#import <UIKit/UIKit.h>

//Makes an image out of color

@interface UIImage (Color)

+ (UIImage*)imageWithSize:(CGSize)size color:(UIColor*)color;

@end
