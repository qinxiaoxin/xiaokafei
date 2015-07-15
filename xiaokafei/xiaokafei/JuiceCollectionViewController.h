//
//  JuiceCollectionViewController.h
//  xiaokafei
//
//  Created by Xin Qin on 7/13/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JuiceCollectionViewController : UICollectionViewController

@property (nonatomic, weak) id<IndexGoToImageDetailProtocol> delegate;

@end
