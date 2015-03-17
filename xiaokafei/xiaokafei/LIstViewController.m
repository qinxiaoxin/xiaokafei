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
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

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
    
    if (self.array.count < 7) {
        _tipLabel.hidden = YES;
    }
    
    _scrollView.contentSize = CGSizeMake(0, lv.frame.size.height);
    _scrollView.contentOffset = self.offset;

    [_scrollView addSubview:lv];
    
    
    [self myOrderButton];
}

- (void)myOrderButton
{
    RCDraggableButton *avatar = [[RCDraggableButton alloc] initInView:self.view WithFrame:CGRectMake(0, 0, MY_ORDER_BUTTON_DIAMETER, MY_ORDER_BUTTON_DIAMETER)];
    avatar.frame = self.myOrderOffset;
    [avatar setBackgroundImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
    [avatar setAutoDocking:NO];
    
    avatar.longPressBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  LongPress!!! ===");
        //More todo here.
        
    };
    
    avatar.tapBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  Tap!!! ===");
        //More todo here.
        
    };
    
    avatar.draggingBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === Dragging!!! ===");
        //More todo here.
        
    };
    
    avatar.dragDoneBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === DragDone!!! ===");
        //More todo here.
        self.myOrderOffset = avatar.frame;
        
    };
    
    avatar.autoDockingBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === AutoDocking!!! ===");
        //More todo here.
        
    };
    
    avatar.autoDockingDoneBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === AutoDockingDone!!! ===");
        //More todo here.
        
    };
}



#pragma mark - ListViewButtonProtocol

- (void)listViewButtonClick:(NSInteger)tag
{
    //Turn to...
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DVC"];
    dvc.tag = tag;
    dvc.aArray = self.array;
    dvc.offset = _scrollView.contentOffset;
    dvc.myOrderOffset = self.myOrderOffset;
    dvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:dvc animated:YES completion:^{
        
    }];
    
}

@end
