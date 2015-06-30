//
//  WTANavigationController.m
//  WTAHelpers
//
//  Copyright (c) 2015 WillowTree, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "WTANavigationController.h"
#import "UIImage+WTAColorImage.h"

@interface WTANavigationController ()

@end

@implementation WTANavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *color = [UIColor colorWithWhite:64.0/255.0 alpha:1.0f];
    UIColor *shadowColor = [UIColor colorWithWhite:42.0f/255.0f alpha:1.0f];
    UIImage *navigationBarImage = [[UIImage wta_imageWithSize:CGSizeMake(2.0, 2.0) color:color] resizableImageWithCapInsets:UIEdgeInsetsZero];
    UIImage *shadowImage = [[UIImage wta_imageWithSize:CGSizeMake(1.0, 1.0) color:shadowColor] resizableImageWithCapInsets:UIEdgeInsetsZero];
    NSDictionary *titleAttributes = @{
                                          NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:18.0f],
                                          NSForegroundColorAttributeName:[UIColor whiteColor]
                                      };
    
    [[self navigationBar] setBackgroundImage:navigationBarImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[self navigationBar] setShadowImage:shadowImage];
    [[self navigationBar] setTranslucent:NO];
    [[self navigationBar] setTitleTextAttributes:titleAttributes];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
