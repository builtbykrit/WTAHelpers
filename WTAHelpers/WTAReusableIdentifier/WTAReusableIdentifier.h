//
//  WTAReusableIdentifier.h
//  WTAHelpers
//
//  Created by Trung Tran on 2/25/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionReusableView (WTAReusableIdentifier)

+ (NSString *)wta_reuseableIdentifier;

@end

@interface UITableViewCell (WTAReusableIdentifier)

+ (NSString *)wta_reuseableIdentifier;

@end

@interface UICollectionViewCell (WTAReusableIdentifier)

+ (NSString *)wta_reuseableIdentifier;

@end

@interface UITableViewHeaderFooterView (WTAReusableIdentifier)

+ (NSString *)wta_reuseableIdentifier;

@end
