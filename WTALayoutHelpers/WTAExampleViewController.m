//
//  WTAViewController.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/18/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTAExampleViewController.h"
#import "WTAFrameHelpersCell.h"
#import "UIView+Helpers.h"

typedef NS_ENUM(NSInteger, WTAExampleViewCellType)
{
   WTAExampleViewCellTypeFirst = 0,
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
    return @"Frame Setter";
}

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTAFrameHelpersCell *cell = [tableView dequeueReusableCellWithIdentifier:WTAFrameHelpersCellIdentifier
                                                                forIndexPath:indexPath];
    
    UILabel *titleLabel = [cell titleLabel];
    UIView *childView = [cell childView];
    
    NSString *title = [NSString stringWithFormat:@"%@", NSStringFromSelector(@selector(leftAlignForSuperView))];
    [childView leftAlignForSuperView];
    [titleLabel setText:title];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

@end
