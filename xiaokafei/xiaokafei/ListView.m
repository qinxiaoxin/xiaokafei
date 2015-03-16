//
//  ListView.m
//  xiaokafei
//
//  Created by Xin Qin on 1/25/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ListView.h"

@implementation ListView

- (id)initWithFrame:(CGRect)frame passArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.frame = CGRectMake(0, 0, LIST_VIEW_BUTTON_WIDTH, array.count * LIST_VIEW_BUTTON_HEIGHT);
        
        for (int i = 0; i < array.count; i ++) {
            
            UIButton *listViewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, LIST_VIEW_BUTTON_HEIGHT * i, LIST_VIEW_BUTTON_WIDTH, LIST_VIEW_BUTTON_HEIGHT)];
            NSDictionary *dic = [array objectAtIndex:i];
            NSString *name = [dic valueForKeyPath:@"name"];
            NSString *ename = [dic valueForKeyPath:@"ename"];
            self.passTitle = [NSString stringWithFormat:@"%@(%@)",name,ename];
            NSString *price = [dic valueForKeyPath:@"price"];
            NSString *title = [NSString stringWithFormat:@"%@(%@) %@",name,ename,price];
            [listViewButton setTitle:title forState:UIControlStateNormal];
            [listViewButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            listViewButton.titleLabel.tintColor = [UIColor whiteColor];
            listViewButton.titleLabel.font = [UIFont fontWithName:@"MINIj4gj" size:50.f];
            [listViewButton addTarget:self action:@selector(listViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:listViewButton];
        }

    }
    
    return self;
}

- (void)listViewButtonClick:(id)sender
{
    NSString *title = self.passTitle;
    [_delegate listViewButtonClick:title];
}

@end
