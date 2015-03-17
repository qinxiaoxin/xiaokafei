//
//  FirstPageViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/7/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "FirstPageViewController.h"
#import "LIstViewController.h"
#import "AppDelegate.h"

@interface FirstPageViewController ()

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareListViewController:(LIstViewController *)lvc toArray:(NSArray *)array
{
    lvc.array = array;
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
