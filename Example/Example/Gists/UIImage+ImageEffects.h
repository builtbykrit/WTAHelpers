//
//  UIImage+ImageEffects.h
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//
//

#import <UIKit/UIKit.h>

// Apple sample code that does blurring on the CPU.

@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end