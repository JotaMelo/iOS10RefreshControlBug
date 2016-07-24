//
//  TableViewController.h
//  RefreshControlBug
//
//  Created by Jota Melo on 24/07/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (assign, nonatomic) BOOL refreshOnViewDidLoad;
@property (assign, nonatomic) BOOL refreshOnViewWillAppear;
@property (assign, nonatomic) BOOL refreshOnViewDidAppear;
@property (assign, nonatomic) BOOL refreshOnViewDidAppearChangingContentOffset;

@end
