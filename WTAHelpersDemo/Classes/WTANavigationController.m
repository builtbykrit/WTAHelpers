//
//  WTANavigationController.m
//  WTAHelpers
//
//  Created by Trung Tran on 2/26/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
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
