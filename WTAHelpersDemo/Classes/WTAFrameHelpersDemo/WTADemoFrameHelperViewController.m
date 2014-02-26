//
//  WTAViewController.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/18/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTADemoFrameHelperViewController.h"
#import "WTAHelpers.h"
#import "WTAFrameHelpersCell.h"

typedef NS_ENUM(NSInteger, WTAExampleViewCellType)
{
    WTAExampleViewCellTypeFrameGetterSetter = 0,
    WTAExampleViewCellTypeAlign,
    WTAExampleViewCellTypeAdjacentViews,
    WTAExampleViewCellTypeCount,
};

@interface WTADemoFrameHelperViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation WTADemoFrameHelperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"WTFrameHelpers"];
    [[self tableView] registerNib:[WTAFrameHelpersCell wta_nib] forCellReuseIdentifier:[WTAFrameHelpersCell wta_reuseableIdentifier]];
}

#pragma mark - Instance Methods

+ (UILabel *)createTestLabel
{
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 40.0)];
    [testLabel setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    [testLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    [testLabel setNumberOfLines:2];
    [testLabel setTextAlignment:NSTextAlignmentCenter];
    
    return testLabel;
}

- (void)configureFrameGetterSetterCell:(WTAFrameHelpersCell *)cell
{
    UIView *parentView = [cell parentView];
    
    UILabel *sizeLabel = [WTADemoFrameHelperViewController createTestLabel];
    [sizeLabel wta_setFrameSize:CGSizeMake(100.0, 40.0)];
    [sizeLabel wta_setFrameOrigin:CGPointMake(20.0, 40.0)];
    [sizeLabel setText:[NSString stringWithFormat:@"Origin: {%2.f, %2.f}\nSize: {%2.f, %2.f}",
                        [sizeLabel wta_frameOriginX],
                        [sizeLabel wta_frameOriginY],
                        [sizeLabel wta_frameSizeWidth],
                        [sizeLabel wta_frameSizeHeight]]];
    
    [parentView addSubview:sizeLabel];
    
    UILabel *sizeLabel2 = [WTADemoFrameHelperViewController createTestLabel];
    [sizeLabel2 wta_setFrameSizeWidth:100.0];
    [sizeLabel2 wta_setFrameSizeHeight:40.0];
    [sizeLabel2 wta_setFrameOriginX:120.0];
    [sizeLabel2 wta_setFrameOriginY:100.0];
    [sizeLabel2 setText:[NSString stringWithFormat:@"Origin: %@\nSize: %@",
                         NSStringFromCGPoint([sizeLabel2 wta_frameOrigin]),
                         NSStringFromCGSize([sizeLabel2 wta_frameSize])]];
    
    [parentView addSubview:sizeLabel2];
}

- (void)configureAlignCellOffset:(WTAFrameHelpersCell *)cell offset:(CGFloat)offset
{
    UIView *parentView = [cell parentView];
    
    UILabel *leftLabel = [WTADemoFrameHelperViewController createTestLabel];
    [leftLabel setText:@"Center: V\nAlign: Left"];
    UILabel *topLabel = [WTADemoFrameHelperViewController createTestLabel];
    [topLabel setText:@"Center: H\nAlign: Top"];
    UILabel *rightLabel = [WTADemoFrameHelperViewController createTestLabel];
    [rightLabel setText:@"Center: V\nAlign: Right"];
    UILabel *bottomLabel = [WTADemoFrameHelperViewController createTestLabel];
    [bottomLabel setText:@"Center: H\nAlign: Bottom"];
    UILabel *centerLabel = [WTADemoFrameHelperViewController createTestLabel];
    [centerLabel setText:@"Center: V, H"];
    
    [parentView addSubview:leftLabel];
    [parentView addSubview:rightLabel];
    [parentView addSubview:topLabel];
    [parentView addSubview:bottomLabel];
    [parentView addSubview:centerLabel];
    
    [leftLabel wta_centerAlignVerticallyInSuperviewOffset:offset];
    [rightLabel wta_centerAlignVerticallyInSuperviewOffset:offset];
    [leftLabel wta_leftAlignInSuperviewOffset:offset];
    [rightLabel wta_rightAlignInSuperviewOffset:offset];
    [centerLabel wta_centerAlignInSuperviewOffset:CGPointMake(offset, offset)];
    
    [topLabel wta_centerAlignHorizontallyInSuperviewOffset:offset];
    [bottomLabel wta_centerAlignHorizontallyInSuperviewOffset:offset];
    [topLabel wta_topAlignInSuperviewOffset:offset];
    [bottomLabel wta_bottomAlignInSuperviewOffset:offset];
}

- (void)configureAdjacentCell:(WTAFrameHelpersCell *)cell
{
    UIView *parentView = [cell parentView];
    
    UILabel *centeredView = [WTADemoFrameHelperViewController createTestLabel];
    [parentView addSubview:centeredView];
    [centeredView setText:@"Center: V, H"];
    [centeredView wta_centerAlignInSuperview];
    
    UILabel *leftView = [WTADemoFrameHelperViewController createTestLabel];
    [parentView addSubview:leftView];
    [leftView setText:@"Adjacent Left"];
    [leftView wta_centerAlignVerticallyInSuperview];
    [leftView wta_setFrameOriginXLeftOfView:centeredView offset:5.0];
    
    UILabel *rightView = [WTADemoFrameHelperViewController createTestLabel];
    [parentView addSubview:rightView];
    [rightView setText:@"Adjacent Right"];
    [rightView wta_centerAlignVerticallyInSuperview];
    [rightView wta_setFrameOriginXRightOfView:centeredView offset:5.0];
    
    UILabel *topView = [WTADemoFrameHelperViewController createTestLabel];
    [parentView addSubview:topView];
    [topView setText:@"Adjacent Top"];
    [topView wta_centerAlignHorizontallyInSuperview];
    [topView wta_setFrameOriginYAboveView:centeredView offset:5.0];
    
    UILabel *bottomView = [WTADemoFrameHelperViewController createTestLabel];
    [parentView addSubview:bottomView];
    [bottomView setText:@"Adjacent Bottom"];
    [bottomView wta_centerAlignHorizontallyInSuperview];
    [bottomView wta_setFrameOriginYBelowView:centeredView offset:5.0];
}

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTAFrameHelpersCell *cell = [tableView dequeueReusableCellWithIdentifier:[WTAFrameHelpersCell wta_reuseableIdentifier]
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
            [self configureAlignCellOffset:cell offset:5.0];
            title = @"Aligning and Centering in Superview With Offset";
            break;
            
        case WTAExampleViewCellTypeAdjacentViews:
            
            [self configureAdjacentCell:cell];
            title = @"Place View Adjacent to Sibling Views";
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
    return WTAExampleViewCellTypeCount;
}

@end
