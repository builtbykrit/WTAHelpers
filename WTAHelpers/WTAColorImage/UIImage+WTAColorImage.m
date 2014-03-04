//
//  UIImage+WTAColorImage.h
//
//  Created by Novall Khan on 2/12/14.
//

#import "UIImage+WTAColorImage.h"

@implementation UIImage (WTAColorImage)

+ (UIImage *)wta_imageWithSize:(CGSize)size color:(UIColor *)color
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    view.backgroundColor = color;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, 0);
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
