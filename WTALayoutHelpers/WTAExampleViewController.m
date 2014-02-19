//
//  WTAViewController.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/18/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTAExampleViewController.h"
#import "WTAFrameHelpersCell.h"
#import "UIView+WTAFrameHelpers.h"

typedef NS_ENUM(NSInteger, WTAExampleViewCellType)
{
    WTAExampleViewCellTypeFrameGetterSetter = 0,
    WTAExampleViewCellTypeAlign,
    WTAExampleViewCellTypeAlignOffset,
    WTAExampleViewCellTypeCount,
};

@interface WTAExampleViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation WTAExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self tableView] registerNib:[UINib nibWithNibName:WTAFrameHelpersCellNibName bundle:nil]
           forCellReuseIdentifier:WTAFrameHelpersCellIdentifier];
}

#pragma mark - UITableViewDelegate Methods

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"UIView+WTAFrameHelpers";
}

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTAFrameHelpersCell *cell = [tableView dequeueReusableCellWithIdentifier:WTAFrameHelpersCellIdentifier
                                                                forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UILabel *titleLabel = [cell titleLabel];
    NSString *title = nil;
    
    switch ((WTAExampleViewCellType)[indexPath row])
    {
        case WTAExampleViewCellTypeFrameGetterSetter:
            [self configureFrameGetterSetterCell:cell];
            title = @"Getting and Setter Frame Methods";
            break;
            
        case WTAExampleViewCellTypeAlign:
            [self configureAlignCell:cell];
            title = @"Aligning and Centering in Superview";
            break;
            
        case WTAExampleViewCellTypeAlignOffset:
            
            [self configureAlignCellOffset:cell];
            title = @"Aligning and Centering in Superview with Offset";
            break;
            
        default:
            break;
    }
    
    [titleLabel setText:title];
    
    return cell;
}

+ (UILabel *)createTestLabel
{
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 40.0)];
    [testLabel setBackgroundColor:[UIColor greenColor]];
    [testLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    [testLabel setNumberOfLines:2];
    [testLabel setTextAlignment:NSTextAlignmentCenter];
    
    return testLabel;
}

- (void)configureFrameGetterSetterCell:(WTAFrameHelpersCell *)cell
{
    UIView *parentView = [cell parentView];
    
    UILabel *sizeLabel = [WTAExampleViewController createTestLabel];
    [sizeLabel wta_setFrameSize:CGSizeMake(100.0, 40.0)];
    [sizeLabel wta_setFrameOrigin:CGPointMake(20.0, 40.0)];
    [sizeLabel setText:[NSString stringWithFormat:@"Origin: {%2.f, %2.f}\nSize: {%2.f, %2.f}",
                       [sizeLabel wta_frameOriginX],
                       [sizeLabel wta_frameOriginY],
                       [sizeLabel wta_frameSizeWidth],
                       [sizeLabel wta_frameSizeHeight]]];
    
    [parentView addSubview:sizeLabel];
    
    UILabel *sizeLabel2 = [WTAExampleViewController createTestLabel];
    [sizeLabel2 wta_setFrameSizeWidth:100.0];
    [sizeLabel2 wta_setFrameSizeHeight:40.0];
    [sizeLabel2 wta_setFrameOriginX:120.0];
    [sizeLabel2 wta_setFrameOriginY:100.0];
    [sizeLabel2 setText:[NSString stringWithFormat:@"Origin: %@\nSize: %@",
                       NSStringFromCGPoint([sizeLabel2 wta_frameOrigin]),
                       NSStringFromCGSize([sizeLabel2 wta_frameSize])]];
    
    [parentView addSubview:sizeLabel2];
}

- (void)configureAlignCell:(WTAFrameHelpersCell *)cell
{
    UIView *parentView = [cell parentView];
    
    UILabel *leftLabel = [WTAExampleViewController createTestLabel];
    [leftLabel setText:@"Center: V\nAlign: Left"];
    UILabel *topLabel = [WTAExampleViewController createTestLabel];
    [topLabel setText:@"Center: H\nAlign: Top"];
    UILabel *rightLabel = [WTAExampleViewController createTestLabel];
    [rightLabel setText:@"Center: V\nAlign: Right"];
    UILabel *bottomLabel = [WTAExampleViewController createTestLabel];
    [bottomLabel setText:@"Center: H\nAlign: Bottom"];
    
    [parentView addSubview:leftLabel];
    [parentView addSubview:rightLabel];
    [parentView addSubview:topLabel];
    [parentView addSubview:bottomLabel];
    
    [leftLabel wta_centerAlignVerticallyInSuperview];
    [rightLabel wta_centerAlignVerticallyInSuperview];
    [leftLabel wta_leftAlignInSuperview];
    [rightLabel wta_rightAlignInSuperview];
    
    [topLabel wta_centerAlignHorizontallyInSuperview];
    [bottomLabel wta_centerAlignHorizontallyInSuperview];
    [topLabel wta_topAlignInSuperview];
    [bottomLabel wta_bottomAlignInSuperview];
}

- (void)configureAlignCellOffset:(WTAFrameHelpersCell *)cell
{
    UIView *parentView = [cell parentView];
    
    UILabel *leftLabel = [WTAExampleViewController createTestLabel];
    [leftLabel setText:@"Center: V\nAlign: Left"];
    UILabel *topLabel = [WTAExampleViewController createTestLabel];
    [topLabel setText:@"Center: H\nAlign: Top"];
    UILabel *rightLabel = [WTAExampleViewController createTestLabel];
    [rightLabel setText:@"Center: V\nAlign: Right"];
    UILabel *bottomLabel = [WTAExampleViewController createTestLabel];
    [bottomLabel setText:@"Center: H\nAlign: Bottom"];
    
    [parentView addSubview:leftLabel];
    [parentView addSubview:rightLabel];
    [parentView addSubview:topLabel];
    [parentView addSubview:bottomLabel];
    
    [leftLabel wta_centerAlignVerticallyInSuperviewOffset:10.0];
    [rightLabel wta_centerAlignVerticallyInSuperviewOffset:10.0];
    [leftLabel wta_leftAlignInSuperviewOffset:10.0];
    [rightLabel wta_rightAlignInSuperviewOffset:10.0];
    
    [topLabel wta_centerAlignHorizontallyInSuperviewOffset:10.0];
    [bottomLabel wta_centerAlignHorizontallyInSuperviewOffset:10.0];
    [topLabel wta_topAlignInSuperviewOffset:10.0];
    [bottomLabel wta_bottomAlignInSuperviewOffset:10.0];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return WTAExampleViewCellTypeCount;
}

@end
