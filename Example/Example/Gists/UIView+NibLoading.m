//
//  UIView+NibLoading.m
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+(instancetype)loadInstanceFromNib
{
    UIView *result = nil;
    NSArray *topLevelObjects = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:nil options:nil];
    
    for (id anObject in topLevelObjects)
    {
        if ([anObject isKindOfClass:[self class]])
        {
            result = anObject;
            break;
        }
    }
    
    return result;
}

@end