//
//  WTAExampleAutoLayoutCell.h
//  WTAHelpers
//
//  Created by Trung Tran on 2/25/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const WTAFrameHelpersCellIdentifier;
FOUNDATION_EXPORT NSString *const WTAFrameHelpersCellNibName;

@interface WTADemoAutoLayoutCell : UITableViewCell

@property (nonatomic, readwrite, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, readwrite, weak) IBOutlet UIView *parentView;

@end
