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

#import "FirstPageViewController.h"

@interface LIstViewController ()<ListViewButtonProtocol>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (strong, nonatomic) RCDraggableButton *avatar;

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
    _avatar = [[RCDraggableButton alloc] initInView:self.view WithFrame:CGRectMake(0, 0, MY_ORDER_BUTTON_DIAMETER, MY_ORDER_BUTTON_DIAMETER)];
    _avatar.frame = self.myOrderOffset;
    [_avatar setBackgroundImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
    [_avatar setAutoDocking:NO];
    
    _avatar.longPressBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  LongPress!!! ===");
        //More todo here.
        
    };
    
    _avatar.tapBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  Tap!!! ===");
        //More todo here.
        
    };
    
    _avatar.draggingBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === Dragging!!! ===");
        //More todo here.
        
    };
    
    _avatar.dragDoneBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === DragDone!!! ===");
        //More todo here.
        
    };
    
    _avatar.autoDockingBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === AutoDocking!!! ===");
        //More todo here.
        
    };
    
    _avatar.autoDockingDoneBlock = ^(RCDraggableButton *avatar) {
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
    dvc.myOrderOffset = _avatar.frame;
    dvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:dvc animated:YES completion:^{
        
    }];
    
}

#pragma mark - Navigation

- (void)prepareListViewController:(FirstPageViewController *)fpvc toCGRect:(CGRect)rect
{
    fpvc.myOrderOffset = rect;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"List_First"]) {
        if ([segue.destinationViewController isKindOfClass:[FirstPageViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toCGRect:_avatar.frame];
        }
    }
}

@end
