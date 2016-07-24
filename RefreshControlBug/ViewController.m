//
//  ViewController.m
//  RefreshControlBug
//
//  Created by Jota Melo on 24/07/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TableViewController *tableViewController = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"didLoad"]) {
        tableViewController.refreshOnViewDidLoad = YES;
    } else if ([segue.identifier isEqualToString:@"willAppear"]) {
        tableViewController.refreshOnViewWillAppear = YES;
    } else if ([segue.identifier isEqualToString:@"didAppear"]) {
        tableViewController.refreshOnViewDidAppear = YES;
    } else if ([segue.identifier isEqualToString:@"didAppearChangingOffset"]) {
        tableViewController.refreshOnViewDidAppearChangingContentOffset = YES;
    }
}

@end
