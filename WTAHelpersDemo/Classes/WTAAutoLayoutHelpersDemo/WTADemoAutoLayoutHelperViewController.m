//
//  WTAExampleAutoLayoutHelperViewController.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/19/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTADemoAutoLayoutHelperViewController.h"
#import "WTADemoAutoLayoutCell.h"
#import "WTAHelpers.h"

typedef NS_ENUM(NSInteger, WTADemoCellType)
{
    WTADemoCellTypeEdges,
    WTADemoCellTypeInset,
    WTADemoCellTypeHeight,
    WTADemoCellTypeWidth,
    WTADemoCellTypeHorizontalSibling,
    WTADemoCellTypeVerticalSibling,
    WTADemoCellTypeIntrinsicContent,
    WTADemoCellTypeCentering,
    WTADemoCellTypeCount
};

@interface WTADemoAutoLayoutHelperViewController ()

@end

@implementation WTADemoAutoLayoutHelperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"WTAAutoLayoutHelpers"];
    [[self tableView] registerNib:[WTADemoAutoLayoutCell wta_nib] forCellReuseIdentifier:[WTADemoAutoLayoutCell wta_reuseableIdentifier]];
    
    // Automatically sets TranslatesAutoresizingMasksToConstraints to NO for all constraints added using helpers
    [UIView wta_setAutomaticallySetAutoTranslatesAutoresizingMasksToOff:YES];
}

#pragma mark - Instance Methods

+ (UILabel *)createTestLabel
{
    UILabel *testLabel = [UILabel new];
    [testLabel setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
    [testLabel setTextColor:[UIColor colorWithWhite:64.0f/255.0f alpha:1.0]];
    [testLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    [testLabel setNumberOfLines:2];
    [testLabel setTextAlignment:NSTextAlignmentCenter];
    
    return testLabel;
}

- (void)configureEdgesCell:(WTADemoAutoLayoutCell *)cell
{
    CGSize size = CGSizeMake(80.0, 30.0);
    
    // Leading constraint
    UILabel *leadingLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:leadingLabel];
    [leadingLabel wta_addSizeConstraints:size];
    [leadingLabel wta_addLeadingConstraintToSuperviewOffset:5.0];
    [leadingLabel wta_addVerticallyCenterConstraintToSuperview];
    
    // Trailing constraint
    UILabel *trailingLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:trailingLabel];
    [trailingLabel wta_addSizeConstraints:size];
    [trailingLabel wta_addTrailingConstraintToSuperviewOffset:5.0];
    [trailingLabel wta_addVerticallyCenterConstraintToSuperviewOffset:0.0];
    
    // Top constraint
    UILabel *topLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:topLabel];
    [topLabel wta_addSizeConstraints:size];
    [topLabel wta_addTopConstraintToSuperviewOffset:5.0];
    [topLabel wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
    
    // Bottom constraint
    UILabel *bottomLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:bottomLabel];
    [bottomLabel wta_addSizeConstraints:size];
    [bottomLabel wta_addBottomConstraintToSuperviewOffset:5.0];
    [bottomLabel wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
}

- (void)configureInsetCell:(WTADemoAutoLayoutCell *)cell
{
    UILabel *bottomLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:bottomLabel];
    [bottomLabel wta_addEdgeConstraintsToSuperview:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
}

- (void)configureHorizontalSiblingCell:(WTADemoAutoLayoutCell *)cell
{
    UILabel *firstLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:firstLabel];
    [firstLabel wta_addHeightConstraint:50.0];
    [firstLabel wta_addWidthConstraint:80.0];
    [firstLabel wta_addVerticallyCenterConstraintToSuperviewOffset:0.0];
    [firstLabel wta_addLeadingConstraintToSuperviewOffset:5.0];
    
    UILabel *secondLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:secondLabel];
    [secondLabel wta_addHeightConstraint:50.0];
    [secondLabel wta_addVerticallyCenterConstraintToSuperviewOffset:0.0];
    [secondLabel wta_addConstraintPlacingViewRightOfView:firstLabel separation:5.0];
    
    UILabel *thirdLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:thirdLabel];
    [thirdLabel wta_addHeightConstraint:50.0];
    [thirdLabel wta_addWidthConstraint:80.0];
    [thirdLabel wta_addVerticallyCenterConstraintToSuperviewOffset:0.0];
    [thirdLabel wta_addTrailingConstraintToSuperviewOffset:5.0];
    
    [secondLabel wta_addConstraintPlacingViewLeftOfView:thirdLabel separation:5.0];
    
    UILabel *alignLeftLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:alignLeftLabel];
    [alignLeftLabel wta_addHeightConstraint:30.0];
    [alignLeftLabel wta_addWidthConstraint:120.0];
    [alignLeftLabel wta_addTopConstraintToSuperviewOffset:5.0];
    [alignLeftLabel wta_addLeadingConstraintToView:firstLabel offset:0.0];
    
    UILabel *alignRightLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:alignRightLabel];
    [alignRightLabel wta_addHeightConstraint:30.0];
    [alignRightLabel wta_addWidthConstraint:120.0];
    [alignRightLabel wta_addTopConstraintToSuperviewOffset:5.0];
    [alignRightLabel wta_addTrailingConstraintToView:thirdLabel offset:0.0];
}

- (void)configureVerticalSiblingCell:(WTADemoAutoLayoutCell *)cell
{
    UILabel *firstLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:firstLabel];
    [firstLabel wta_addHeightConstraint:30.0];
    [firstLabel wta_addWidthConstraint:80.0];
    [firstLabel wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
    [firstLabel wta_addTopConstraintToSuperviewOffset:5.0];
    
    UILabel *secondLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:secondLabel];
    [secondLabel wta_addWidthConstraint:80.0];
    [secondLabel wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
    [secondLabel wta_addConstraintPlacingViewBelowView:firstLabel separation:5.0];
    
    UILabel *thirdLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:thirdLabel];
    [thirdLabel wta_addHeightConstraint:30.0];
    [thirdLabel wta_addWidthConstraint:80.0];
    [thirdLabel wta_addHorizontallyCenterConstraintToSuperviewOffset:0.0];
    [thirdLabel wta_addBottomConstraintToSuperviewOffset:5.0];
    [secondLabel wta_addConstraintPlacingViewAboveView:thirdLabel separation:5.0];
    
    UILabel *alignTopLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:alignTopLabel];
    [alignTopLabel wta_addHeightConstraint:30.0];
    [alignTopLabel wta_addWidthConstraint:80.0];
    [alignTopLabel wta_addLeadingConstraintToSuperviewOffset:5.0];
    [alignTopLabel wta_addTopConstraintToView:firstLabel offset:0.0];
    
    UILabel *alignBottomLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:alignBottomLabel];
    [alignBottomLabel wta_addSizeConstraints:CGSizeMake(80.0, 30.0)];
    [alignBottomLabel wta_addLeadingConstraintToSuperviewOffset:5.0];
    [alignBottomLabel wta_addBottomConstraintToView:thirdLabel offset:0.0];
}

- (void)configureIntrinsicCell:(WTADemoAutoLayoutCell *)cell
{
    UIView *intrinsicView = [UIView wta_autolayoutView];
    [intrinsicView setBackgroundColor:[UIColor colorWithWhite:62.0f/255.0f alpha:1.0]];
    [[cell parentView] addSubview:intrinsicView];
    [intrinsicView wta_addCenteringConstraintToSuperview];
    
    UILabel *intrinsicLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [intrinsicLabel setText:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."];
    [intrinsicLabel setPreferredMaxLayoutWidth:100.0];
    [intrinsicLabel setNumberOfLines:0];
    [intrinsicView addSubview:intrinsicLabel];
    [intrinsicLabel wta_addEdgeConstraintsToSuperview:UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)];
}

- (void)configureCenteringCell:(WTADemoAutoLayoutCell *)cell
{
    UILabel *testLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:testLabel];
    [testLabel wta_addSizeConstraints:CGSizeMake(50.0, 50.0)];
    [testLabel wta_addCenteringConstraintToSuperviewOffset:CGPointMake(-20.0, -20.0)];
    
    UILabel *testLabel2 = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:testLabel2];
    [testLabel2 wta_addSizeConstraints:CGSizeMake(50.0, 50.0)];
    [testLabel2 wta_addConstraintPlacingViewBelowView:testLabel separation:5.0];
    [testLabel2 wta_addHorizontallyCenterConstraintToView:testLabel offset:0.0];
    
    UILabel *testLabel3 = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:testLabel3];
    [testLabel3 wta_addSizeConstraints:CGSizeMake(50.0, 50.0)];
    [testLabel3 wta_addConstraintPlacingViewRightOfView:testLabel separation:5.0];
    [testLabel3 wta_addVerticallyCenterConstraintToView:testLabel offset:0.0];
}

- (void)configureHeightCell:(WTADemoAutoLayoutCell *)cell
{
    UILabel *testLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:testLabel];
    [testLabel wta_addHeightConstraintToSuperView];
    [testLabel wta_addWidthConstraint:55];
    [testLabel wta_addCenteringConstraintToSuperviewOffset:CGPointMake(0, 0)];
    
}

- (void)configureWidthCell:(WTADemoAutoLayoutCell *)cell
{
    UILabel *testLabel = [WTADemoAutoLayoutHelperViewController createTestLabel];
    [[cell parentView] addSubview:testLabel];
    [testLabel wta_addWidthConstraintToSuperView];
    [testLabel wta_addHeightConstraint:55];
    [testLabel wta_addCenteringConstraintToSuperviewOffset:CGPointMake(0, 0)];
}

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTADemoAutoLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:[WTADemoAutoLayoutCell wta_reuseableIdentifier]
                                                                forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UILabel *titleLabel = [cell titleLabel];
    NSString *title = nil;
    
    switch ((WTADemoCellType)[indexPath row])
    {
        case WTADemoCellTypeEdges:
            
            [self configureEdgesCell:cell];
            title = @"Edge in Superview";
            break;
            
        case WTADemoCellTypeInset:
            
            [self configureInsetCell:cell];
            title = @"Inset in Superview";
            break;
            
        case WTADemoCellTypeHeight:
            
            title = @"Height of Superview";
            [self configureHeightCell:cell];
            break;
            
        case WTADemoCellTypeWidth:
            
            title = @"Width of Superview";
            [self configureWidthCell:cell];
            break;
            
        case WTADemoCellTypeHorizontalSibling:
            
            title = @"Horizontal Siblings";
            [self configureHorizontalSiblingCell:cell];
            break;
            
        case WTADemoCellTypeVerticalSibling:
            
            title = @"Vertical Siblings";
            [self configureVerticalSiblingCell:cell];
            break;
        case WTADemoCellTypeIntrinsicContent:
            
            title = @"Dynamic Fitting Size from a Label's Intrinsic Content Size";
            [self configureIntrinsicCell:cell];
            break;
            
        case WTADemoCellTypeCentering:
            
            title = @"Centering Views";
            [self configureCenteringCell:cell];
            break;
            
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
    return WTADemoCellTypeCount;
}

@end
