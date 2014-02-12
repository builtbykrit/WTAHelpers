//
//  UIImage+Color.m
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage*)imageWithSize:(CGSize)size color:(UIColor*)color
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    view.backgroundColor = color;
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, 0);
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
