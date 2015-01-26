//
//  LIstViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/7/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "LIstViewController.h"
#import "DetailViewController.h"

#import "ListView.h"

@interface LIstViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation LIstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //init view
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init view

- (void)initView
{
    ListView *lv = [[ListView alloc] initWithFrame:CGRectZero passArray:self.array];
    _scrollView.contentSize = CGSizeMake(0, lv.frame.size.height);
    
    [_scrollView addSubview:lv];
}

@end
