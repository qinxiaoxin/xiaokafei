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

@interface LIstViewController ()<ListViewButtonProtocol>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation LIstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
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
    lv.delegate = self;
    
    _scrollView.contentSize = CGSizeMake(0, lv.frame.size.height);
    _scrollView.contentOffset = self.offset;

    [_scrollView addSubview:lv];
}

#pragma mark - ListViewButtonProtocol

- (void)listViewButtonClick:(NSString *)title
{
    //Mark scorlView offset
    CGPoint offset = _scrollView.contentOffset;
    
    //Turn to...
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DVC"];
    dvc.aTitle = title;
    dvc.aArray = self.array;
    dvc.offset = offset;
    dvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:dvc animated:YES completion:^{
        
    }];
    
}

@end
