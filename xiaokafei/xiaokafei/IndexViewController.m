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

@interface IndexViewController ()

@property (nonatomic) CAPSPageMenu *pageMenu;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"小咖啡";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor orangeColor],NSFontAttributeName: [UIFont fontWithName:Font size:30.f]};
    
    CoffeeCollectionViewController *coffee = [[CoffeeCollectionViewController alloc] initWithNibName:@"CoffeeCollectionViewController" bundle:nil];
    coffee.title = @"咖啡";
    
    JuiceCollectionViewController *juice = [[JuiceCollectionViewController alloc] initWithNibName:@"JuiceCollectionViewController" bundle:nil];
    juice.title = @"果汁";
    
    MilkIceCollectionViewController *milk_ice = [[MilkIceCollectionViewController alloc] initWithNibName:@"MilkIceCollectionViewController" bundle:nil];
    milk_ice.title = @"奶昔、沙冰";
    
    FoodCollectionViewController *food = [[FoodCollectionViewController alloc] initWithNibName:@"FoodCollectionViewController" bundle:nil];
    food.title = @"简餐小食";
    
    CakeCollectionViewController *cake = [[CakeCollectionViewController alloc] initWithNibName:@"CakeCollectionViewController" bundle:nil];
    cake.title = @"糕点";
    
    DrinkCollectionViewController *drink = [[DrinkCollectionViewController alloc] initWithNibName:@"DrinkCollectionViewController" bundle:nil];
    drink.title = @"鸡尾酒";
    
    FlowerTeaCollectionViewController *flower_tea = [[FlowerTeaCollectionViewController alloc] initWithNibName:@"FlowerTeaCollectionViewController" bundle:nil];
    flower_tea.title = @"花茶";
    
    MilkTeaCollectionViewController *milk_tea = [[MilkTeaCollectionViewController alloc] initWithNibName:@"MilkTeaCollectionViewController" bundle:nil];
    milk_tea.title = @"奶茶";
    
    NSArray *controllerArray = @[coffee,juice,milk_ice,food,cake,drink,flower_tea,milk_tea];
    
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
}

@end
