//
//  WTAExampleAutoLayoutHelperViewController.m
//  WTALayoutHelpers
//
//  Created by Trung Tran on 2/19/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

#import "WTAExampleAutoLayoutHelperViewController.h"
#import "WTAExampleAutoLayoutHelperView.h"
#import "UIView+WTAAutoLayoutHelpers.h"

@interface WTAExampleAutoLayoutHelperViewController ()

@end

@implementation WTAExampleAutoLayoutHelperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)loadView
{
    UINib *nib = [UINib nibWithNibName:@"WTAExampleAutoLayoutHelperView" bundle:nil];
    WTAExampleAutoLayoutHelperView *view = (WTAExampleAutoLayoutHelperView *)[[nib instantiateWithOwner:self options:nil] lastObject];
    [self setView:view];
    
    UIView *parentView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 100.0, 320.0, 320.0)];
    [parentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [parentView setBackgroundColor:[UIColor blueColor]];
    
    [view addSubview:parentView];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[parentView]-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(parentView)]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(100)-[parentView]-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(parentView)]];
    
    UIView *edgeView = [UIView wta_autolayoutView];
    [edgeView setBackgroundColor:[UIColor orangeColor]];
    [parentView addSubview:edgeView];
    
    [edgeView wta_addBottomConstraintToSuperviewOffset:-10.0];
    [edgeView wta_addTopConstraintToSuperviewOffset:10.0];
    [edgeView wta_addLeadingConstraintToSuperviewOffset:10.0];
    [edgeView wta_addTrailingConstraintToSuperviewOffset:-10.0];
    
    UIView *sizeView = [UIView wta_autolayoutView];
    [sizeView setBackgroundColor:[UIColor blueColor]];
    [parentView addSubview:sizeView];
    
    [sizeView wta_addLeadingConstraintToSuperviewOffset:20.0];
    [sizeView wta_addTopConstraintToSuperviewOffset:20.0];
    [sizeView wta_addWidthConstraint:100.0];
    [sizeView wta_addHeightConstraint:100.0];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

@end
