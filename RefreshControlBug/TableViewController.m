//
//  TableViewController.m
//  RefreshControlBug
//
//  Created by Jota Melo on 24/07/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.tintColor = [UIColor blueColor];
    
    if (self.refreshOnViewDidLoad) {
        [self refresh];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.refreshOnViewWillAppear) {
        [self refresh];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.refreshOnViewDidAppear) {
        [self refresh];
    } else if (self.refreshOnViewDidAppearChangingContentOffset) {
        [UIView animateWithDuration:.25f animations:^{
            self.tableView.contentOffset = CGPointMake(.0f, -self.refreshControl.frame.size.height);
        }];
        [self refresh];
    }
}

- (void)refresh
{
    [self.refreshControl beginRefreshing];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
    });
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [UITableViewCell new];
    }
    
    cell.textLabel.text = @"Test";
    
    return cell;
}

@end
