//
//  AccessViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 12/21/14.
//  Copyright (c) 2014 Xin Qin. All rights reserved.
//

#import "AccessViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
#import "ModelController.h"

@interface AccessViewController ()

@end

@implementation AccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareRootViewController:(RootViewController *)rootViewController toArray:(NSArray *)array
{
    rootViewController.modelController.pageData = array;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Coffee_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).coffeeArray];
        }
    }else if ([segue.identifier isEqualToString:@"Food_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).foodArray];
        }
    }else if ([segue.identifier isEqualToString:@"Drink_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).drinkArray];
        }
    }else if ([segue.identifier isEqualToString:@"MilkTea_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).milkteaArray];
        }
    }else if ([segue.identifier isEqualToString:@"Juice_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).juiceArray];
        }
    }else if ([segue.identifier isEqualToString:@"Cake_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).cakeArray];
        }
    }else if ([segue.identifier isEqualToString:@"MilkFlake_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).milkflakeArray];
        }
    }else if ([segue.identifier isEqualToString:@"FlowerTea_Detail"]) {
        if ([segue.destinationViewController isKindOfClass:[RootViewController class]]) {
            [self prepareRootViewController:segue.destinationViewController toArray:((AppDelegate *)[[UIApplication sharedApplication] delegate]).flowerteaArray];
        }
    }
}
 

@end
