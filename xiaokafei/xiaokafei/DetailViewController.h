//
//  DetailViewController.h
//  xiaokafei
//
//  Created by Xin Qin on 1/8/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, copy) NSArray *aArray;
@property (nonatomic, assign) CGPoint offset;
@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, assign) CGRect myOrderOffset;

@end
