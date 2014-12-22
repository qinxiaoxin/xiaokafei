//
//  ModelController.h
//  xiaokafei
//
//  Created by Xin Qin on 12/21/14.
//  Copyright (c) 2014 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *pageData;

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

