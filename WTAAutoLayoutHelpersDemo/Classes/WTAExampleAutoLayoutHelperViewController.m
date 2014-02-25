//
//  WTAExampleAutoLayoutHelperViewController.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/19/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTAExampleAutoLayoutHelperViewController.h"
#import "UIView+WTAAutoLayoutHelpers.h"
#import "UIView+WTANibLoading.h"
#import "WTAReusableIdentifier.h"
#import "WTAExampleAutoLayoutCell.h"

typedef NS_ENUM(NSInteger, WTAExampleCellType)
{
    WTAExampleCellTypeEdges,
    WTAExampleCellTypeInset,
    WTAExampleCellTypeCenter,
    WTAExampleCellTypeCount,
};

@interface WTAExampleAutoLayoutHelperViewController ()

@end

@implementation WTAExampleAutoLayoutHelperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self tableView] registerNib:[WTAExampleAutoLayoutCell wta_nib] forCellReuseIdentifier:[WTAExampleAutoLayoutCell wta_reuseableIdentifier]];
}

#pragma mark - Instance Methods

+ (UILabel *)createTestLabel
{
    UILabel *testLabel = [UILabel wta_autolayoutView];
    [testLabel setBackgroundColor:[UIColor greenColor]];
    [testLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    [testLabel setNumberOfLines:2];
    [testLabel setTextAlignment:NSTextAlignmentCenter];
    
    return testLabel;
}

- (void)configureEdgesCell:(WTAExampleAutoLayoutCell *)cell
{
    // Leading constraint
    UILabel *leadingLabel = [WTAExampleAutoLayoutHelperViewController createTestLabel];
    {
        [leadingLabel setText:@"Leading Constraint"];
        [[cell parentView] addSubview:leadingLabel];
        [leadingLabel wta_addSizeConstraints:CGSizeMake(50.0, 30.0)];
        [leadingLabel wta_addLeadingConstraintToSuperviewOffset:5.0];
        [leadingLabel wta_addVerticallyCenterConstraintToSuperviewOffset:0.0];
    }
    
    // Trailing constraint
    UILabel *trailingLabel = [WTAExampleAutoLayoutHelperViewController createTestLabel];
    {
        [trailingLabel setText:@"Trailing Constraint"];
        [[cell parentView] addSubview:trailingLabel];
        [trailingLabel wta_addSizeConstraints:CGSizeMake(50.0, 30.0)];
        [trailingLabel wta_addTrailingConstraintToSuperviewOffset:-5.0];
        [trailingLabel wta_addVerticallyCenterConstraintToSuperviewOffset:0.0];
    }
    
    // Top constraint
    UILabel *topLabel = [WTAExampleAutoLayoutHelperViewController createTestLabel];
    {
        [topLabel setText:@"Top Constraint"];
        [[cell parentView] addSubview:topLabel];
        [topLabel wta_addSizeConstraints:CGSizeMake(50.0, 30.0)];
        [topLabel wta_addTopConstraintToSuperviewOffset:5.0];
        [topLabel wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
    }
    
    // Bottom constraint
    UILabel *bottomLabel = [WTAExampleAutoLayoutHelperViewController createTestLabel];
    {
        [bottomLabel setText:@"Bottom Constraint"];
        [[cell parentView] addSubview:bottomLabel];
        [bottomLabel wta_addSizeConstraints:CGSizeMake(50.0, 30.0)];
        [bottomLabel wta_addBottomConstraintToSuperviewOffset:-5.0];
        [bottomLabel wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
    }
}

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTAExampleAutoLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:[WTAExampleAutoLayoutCell wta_reuseableIdentifier]
                                                                forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UILabel *titleLabel = [cell titleLabel];
    NSString *title = nil;
    
    switch ((WTAExampleCellType)[indexPath row])
    {
        case WTAExampleCellTypeEdges:
        {
            [self configureEdgesCell:cell];
            title = @"Edge Constraints Example";
            break;
        }
            
        case WTAExampleCellTypeInset:
            
            break;
            
        case WTAExampleCellTypeCenter:
        {
            title = @"Centering Constraints Example";
            break;
        }
        default:
            break;
    }
    
    [titleLabel setText:title];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return WTAExampleCellTypeCount;
}

@end
