//
//  FirstPageViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/7/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "FirstPageViewController.h"
#import "LIstViewController.h"

@interface FirstPageViewController ()

@property (nonatomic, strong) RCDraggableButton *avatar;

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self myOrderButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myOrderButton
{
    _avatar = [[RCDraggableButton alloc] initInView:self.view WithFrame:CGRectMake(SCREEN_WIDTH - MY_ORDER_BUTTON_DIAMETER, 0, MY_ORDER_BUTTON_DIAMETER, MY_ORDER_BUTTON_DIAMETER)];
    
    if (self.myOrderOffset.origin.y > 0 || self.myOrderOffset.origin.x > 0) {
        _avatar.frame = self.myOrderOffset;
    }
    
    [_avatar setBackgroundImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
    [_avatar setAutoDocking:NO];
    
    _avatar.longPressBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  LongPress!!! ===");
        //More todo here.
        
    };
    
    _avatar.tapBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  Tap!!! ===");
        //More todo here.
        UIViewController *popin = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyOrderViewController"];
        popin.view.bounds = CGRectMake(0, 0, 320, 480);
        [popin setPopinTransitionStyle:BKTPopinTransitionStyleSnap];
        //[popin setPopinOptions:BKTPopinDisableAutoDismiss];
        BKTBlurParameters *blurParameters = [[BKTBlurParameters alloc] init];
        //blurParameters.alpha = 0.5;
        blurParameters.tintColor = [UIColor colorWithWhite:0 alpha:0.5];
        blurParameters.radius = 0.3;
        [popin setBlurParameters:blurParameters];
        [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
        //popin.presentingController = self;
        
        //Present popin on the desired controller
        //Note that if you are using a UINavigationController, the navigation bar will be active if you present
        // the popin on the visible controller instead of presenting it on the navigation controller

        [self presentPopinController:popin animated:YES completion:^{
            NSLog(@"Popin presented !");
        }];
        
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


#pragma mark - Navigation

- (void)prepareListViewController:(LIstViewController *)lvc toArray:(NSArray *)array
{
    lvc.array = array;
    lvc.myOrderOffset = _avatar.frame;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"Coffee_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).coffeeArray];
        }
    }else if ([segue.identifier isEqualToString:@"MilkTea_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).milkteaArray];
        }
    }else if ([segue.identifier isEqualToString:@"Food_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).foodArray];
        }
    }else if ([segue.identifier isEqualToString:@"Juice_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).juiceArray];
        }
    }else if ([segue.identifier isEqualToString:@"Cocktail_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).drinkArray];
        }
    }else if ([segue.identifier isEqualToString:@"FlowerTea_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).flowerteaArray];
        }
    }else if ([segue.identifier isEqualToString:@"MilkShake_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).milkflakeArray];
        }
    }else if ([segue.identifier isEqualToString:@"Cake_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:(NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).cakeArray];
        }
    }
}

@end
