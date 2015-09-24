//
//  TotalView.m
//  xiaokafei
//
//  Created by Xin Qin on 3/20/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "TotalView.h"

@implementation TotalView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.bounds = CGRectMake(0, 0, 320, 44);
        
        _totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 0, 44, 44)];
        _totalLabel.font = [UIFont fontWithName:Font size:20.f];
        _totalLabel.text = @"合计";
        _totalLabel.textColor = [UIColor brownColor];
        _totalLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_totalLabel];
        
        _totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 44 * 2, 0, 44, 44)];
        _totalPriceLabel.font = [UIFont fontWithName:Font size:20.f];
        _totalPriceLabel.textColor = [UIColor brownColor];
        _totalPriceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_totalPriceLabel];
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
