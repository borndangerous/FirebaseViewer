//
//  IRPDetailViewController.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/11/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "IRPDetailViewController.h"

@interface IRPDetailViewController ()
- (void)configureView;
@end

@implementation IRPDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end