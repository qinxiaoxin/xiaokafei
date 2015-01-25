//
//  ListView.m
//  xiaokafei
//
//  Created by Xin Qin on 1/25/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ListView.h"

@implementation ListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView:_array.count];
    }
    
    return self;
}

- (void)initView:(int)count
{
    self.frame = CGRectMake(0, 0, LIST_VIEW_BUTTON_WIDTH, _array.count * LIST_VIEW_BUTTON_HEIGHT);
    
    for (int i = 0; i < count; i ++) {
        UIButton *listViewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, LIST_VIEW_BUTTON_WIDTH, LIST_VIEW_BUTTON_HEIGHT)];
        
        [self addSubview:listViewButton];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
