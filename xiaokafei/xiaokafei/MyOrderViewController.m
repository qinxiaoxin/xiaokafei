//
//  MyOrderViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 3/17/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "MyOrderViewController.h"

@interface MyOrderViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueBoard;
@property (weak, nonatomic) IBOutlet UIView *whiteBoard;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    self.view.backgroundColor = RGBA(232, 222, 204, 1);
    //
    _blueBoard.backgroundColor = RGBA(3, 135, 151, 1);
    //
    _whiteBoard.backgroundColor = RGBA(226, 226, 226, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)CCMPlayNDropViewWillStartDismissAnimationWithDynamics:(CCMPlayNDropView *)view{
    self.view.superview.userInteractionEnabled = NO;
    self.view.userInteractionEnabled = NO;
}

-(void)CCMPlayNDropViewDidFinishDismissAnimationWithDynamics:(CCMPlayNDropView *)view{
    self.view.superview.userInteractionEnabled = YES;
    CGRect frame = self.view.frame;
    frame.origin.y = -1000;
    self.view.frame = frame;
    [self.parentViewController dismissCurrentPopinControllerAnimated:YES];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
