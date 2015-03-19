//
//  MyOrderViewController.h
//  xiaokafei
//
//  Created by Xin Qin on 3/17/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCMPlayNDropView.h"

@interface MyOrderViewController : UIViewController<CCMPlayNDropViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *mArray;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
