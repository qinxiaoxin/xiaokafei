//
//  IndexViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 7/13/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "IndexViewController.h"
#import "CAPSPageMenu.h"
#import "CoffeeCollectionViewController.h"
#import "JuiceCollectionViewController.h"
#import "MilkIceCollectionViewController.h"
#import "FoodCollectionViewController.h"
#import "CakeCollectionViewController.h"
#import "DrinkCollectionViewController.h"
#import "FlowerTeaCollectionViewController.h"
#import "MilkTeaCollectionViewController.h"
#import "ImageDetailViewController.h"

@interface IndexViewController ()<IndexGoToImageDetailProtocol>

@property (nonatomic, strong) CAPSPageMenu *pageMenu;

@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation IndexViewController


#pragma mark - View controller life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:1.0 delay:0.3 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        self.rightImageView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
}

#pragma mark - Private Methods

- (void)initNav {
    
    self.title = @"小咖啡";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor orangeColor],NSFontAttributeName: [UIFont fontWithName:Font size:30.f]};
    
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 30, 30)];
        _rightImageView.image = [UIImage imageNamed:@"rightBarButtonItem"];
        _rightImageView.userInteractionEnabled = TRUE;
        [_rightImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGoToRight)]];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: _rightImageView];
        _rightImageView.transform = CGAffineTransformMakeScale(0, 0);
    }
    
    [self equipmentOfViewController];
}

- (void)equipmentOfViewController {
    
    CoffeeCollectionViewController *coffee = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"Coffee"];
    coffee.delegate = self;
    coffee.title = @"咖啡";
    
    JuiceCollectionViewController *juice = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"Juice"];
    juice.delegate = self;
    juice.title = @"果汁";
    
    MilkIceCollectionViewController *milk_ice = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"MilkIce"];
    milk_ice.delegate = self;
    milk_ice.title = @"奶昔、沙冰";
    
    CakeCollectionViewController *cake = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"Cake"];
    cake.delegate = self;
    cake.title = @"糕点";
    
    FoodCollectionViewController *food = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"Food"];
    food.delegate = self;
    food.title = @"简餐小食";
    
    DrinkCollectionViewController *drink = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"Drink"];
    drink.delegate = self;
    drink.title = @"鸡尾酒";
    
    FlowerTeaCollectionViewController *flower_tea = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"FlowerTea"];
    flower_tea.delegate = self;
    flower_tea.title = @"花茶";
    
    MilkTeaCollectionViewController *milk_tea = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"MilkTea"];
    milk_tea.delegate = self;
    milk_tea.title = @"奶茶";
    
    NSArray *controllerArray = @[coffee,juice,milk_ice,cake,food,drink,flower_tea,milk_tea];
    
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor orangeColor],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:70.0/255.0 green:70.0/255.0 blue:70.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:Font size:18.f],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [self.view addSubview:_pageMenu.view];
    
    [self setPresentingAnimation];
}

- (void)setPresentingAnimation {
    
    [[RZTransitionsManager shared] setAnimationController:[[RZCirclePushAnimationController alloc] init]
                                       fromViewController:[self class]
                                                forAction:RZTransitionAction_PresentDismiss];
}


#pragma mark - Action

- (void)didTapGoToRight {
    debugLog(@"弹出菜单");
    
    _rightImageView.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        self.rightImageView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
    
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
    
    [self presentPopinController:popin animated:YES completion:^{
        NSLog(@"Popin presented !");
    }];
}


#pragma mark - IndexGoToImageDetail

- (void)goToImageDeatail:(UIImage *)image name:(NSString *)name price:(NSString *)price
{
    [self presentViewController:[self detailImageViewController:image name:name price:price] animated:true completion:nil];
}

- (UIViewController *)detailImageViewController:(UIImage *)image name:(NSString *)name price:(NSString *)price {
    ImageDetailViewController *idvc = [[UIStoryboard storyboardWithName:@"Collection" bundle:nil] instantiateViewControllerWithIdentifier:@"ImageDetail"];
    idvc.image = image;
    idvc.name = name;
    idvc.price = price;
    [idvc setTransitioningDelegate:[RZTransitionsManager shared]];
    // Create a dismiss interaction controller that will be attached to the presented
    // view controller to allow for a custom dismissal
    RZVerticalSwipeInteractionController *dismissInteractionController = [[RZVerticalSwipeInteractionController alloc] init];
    [dismissInteractionController attachViewController:idvc withAction:RZTransitionAction_Dismiss];
    [[RZTransitionsManager shared] setInteractionController:dismissInteractionController
                                         fromViewController:[self class]
                                           toViewController:nil
                                                  forAction:RZTransitionAction_Dismiss];
    return idvc;
}


@end
