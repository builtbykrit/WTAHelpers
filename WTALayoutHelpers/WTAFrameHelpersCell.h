//
//  WTAFrameHelpersCell.h
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/18/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const WTAFrameHelpersCellIdentifier;
FOUNDATION_EXPORT NSString *const WTAFrameHelpersCellNibName;

@interface WTAFrameHelpersCell : UITableViewCell

@property (nonatomic, readwrite, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, readwrite, weak) IBOutlet UIView *parentView;
@property (nonatomic, readwrite, weak) IBOutlet UIView *childView;

@end
