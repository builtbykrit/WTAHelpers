//
//  WTAViewController.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/18/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTAExampleFrameHelperViewController.h"
#import "WTAFrameHelpersCell.h"
#import "UIView+WTAFrameHelpers.h"

typedef NS_ENUM(NSInteger, WTAExampleViewCellType)
{
    WTAExampleViewCellTypeFrameGetterSetter = 0,
    WTAExampleViewCellTypeAlign,
    WTAExampleViewCellTypeAlignOffset,
    WTAExampleViewCellTypeCount,
};

@interface WTAExampleFrameHelperViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation WTAExampleFrameHelperViewController

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
        {
            CGFloat offset = 5.0;
            [self configureAlignCellOffset:cell offset:5.0];
            title = [NSString stringWithFormat:@"Aligning and Centering in Superview with Offset: %2.fpx", offset];
            break;
        }
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
    
    UILabel *sizeLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [sizeLabel wta_setFrameSize:CGSizeMake(100.0, 40.0)];
    [sizeLabel wta_setFrameOrigin:CGPointMake(20.0, 40.0)];
    [sizeLabel setText:[NSString stringWithFormat:@"Origin: {%2.f, %2.f}\nSize: {%2.f, %2.f}",
                       [sizeLabel wta_frameOriginX],
                       [sizeLabel wta_frameOriginY],
                       [sizeLabel wta_frameSizeWidth],
                       [sizeLabel wta_frameSizeHeight]]];
    
    [parentView addSubview:sizeLabel];
    
    UILabel *sizeLabel2 = [WTAExampleFrameHelperViewController createTestLabel];
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
    
    UILabel *leftLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [leftLabel setText:@"Center: V\nAlign: Left"];
    UILabel *topLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [topLabel setText:@"Center: H\nAlign: Top"];
    UILabel *rightLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [rightLabel setText:@"Center: V\nAlign: Right"];
    UILabel *bottomLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [bottomLabel setText:@"Center: H\nAlign: Bottom"];
    UILabel *centerLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [centerLabel setText:@"Center: V, H"];
    
    [parentView addSubview:leftLabel];
    [parentView addSubview:rightLabel];
    [parentView addSubview:topLabel];
    [parentView addSubview:bottomLabel];
    [parentView addSubview:centerLabel];
    
    [leftLabel wta_centerAlignVerticallyInSuperview];
    [rightLabel wta_centerAlignVerticallyInSuperview];
    [leftLabel wta_leftAlignInSuperview];
    [rightLabel wta_rightAlignInSuperview];
    [centerLabel wta_centerAlignInSuperview];
    
    [topLabel wta_centerAlignHorizontallyInSuperview];
    [bottomLabel wta_centerAlignHorizontallyInSuperview];
    [topLabel wta_topAlignInSuperview];
    [bottomLabel wta_bottomAlignInSuperview];
}

- (void)configureAlignCellOffset:(WTAFrameHelpersCell *)cell offset:(CGFloat)offset
{
    UIView *parentView = [cell parentView];
    
    UILabel *leftLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [leftLabel setText:@"Center: V\nAlign: Left"];
    UILabel *topLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [topLabel setText:@"Center: H\nAlign: Top"];
    UILabel *rightLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [rightLabel setText:@"Center: V\nAlign: Right"];
    UILabel *bottomLabel = [WTAExampleFrameHelperViewController createTestLabel];
    [bottomLabel setText:@"Center: H\nAlign: Bottom"];
    UILabel *centerLabel = [WTAExampleFrameHelperViewController createTestLabel];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return WTAExampleViewCellTypeCount;
}

@end
