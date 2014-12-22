//
//  RootViewController.h
//  xiaokafei
//
//  Created by Xin Qin on 12/21/14.
//  Copyright (c) 2014 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) ModelController *modelController;

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

