//
//  ListView.h
//  xiaokafei
//
//  Created by Xin Qin on 1/25/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListView : UIView

- (id)initWithFrame:(CGRect)frame passArray:(NSArray *)array;

@property (nonatomic, weak) id<ListViewButtonProtocol> delegate;

@end
