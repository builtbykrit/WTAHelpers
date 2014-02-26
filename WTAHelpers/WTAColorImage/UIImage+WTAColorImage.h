//
//  UIImage+WTAColorImage.h
//
//  Created by Novall Khan on 2/12/14.
//

#import <UIKit/UIKit.h>

@interface UIImage (WTAColorImage)

/**
 Creates an image with the given color
 
 @param color of the image.
 @param size of the resulting image
 @return The colored image.
 */
+ (UIImage *)wta_imageWithSize:(CGSize)size color:(UIColor *)color;

@end
