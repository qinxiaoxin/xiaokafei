//
//  AppDelegate.m
//  xiaokafei
//
//  Created by Xin Qin on 12/21/14.
//  Copyright (c) 2014 Xin Qin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self initData];
    
    return YES;
}

- (void)initData
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xiaokafei" ofType:@"geojson"]];
    id objectData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
    if ([objectData isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary *)objectData;
        
//        @property (nonatomic, strong) NSArray *coffeeArray;
//        @property (nonatomic, strong) NSArray *foodArray;
//        @property (nonatomic, strong) NSArray *drinkArray;
//        @property (nonatomic, strong) NSArray *juiceArray;
//        @property (nonatomic, strong) NSArray *milkteaArray;
//        @property (nonatomic, strong) NSArray *milkflakeArray;
//        @property (nonatomic, strong) NSArray *flowerteaArray;
        
        _coffeeArray = [dic objectForKeyedSubscript:@"coffee"];
        NSLog(@"_coffeeArray = %d",_coffeeArray.count);
        
        _foodArray = [dic objectForKeyedSubscript:@"food"];
        NSLog(@"_foodArray = %d",_foodArray.count);
        
        _drinkArray = [dic objectForKeyedSubscript:@"drink"];
        NSLog(@"_drinkArray = %d",_drinkArray.count);
        
        _juiceArray = [dic objectForKeyedSubscript:@"juice"];
        NSLog(@"_juiceArray = %d",_juiceArray.count);
        
        _milkteaArray = [dic objectForKeyedSubscript:@"milk_tea"];
        NSLog(@"_milkteaArray = %d",_milkteaArray.count);
        
        _milkflakeArray = [dic objectForKeyedSubscript:@"milk_flake"];
        NSLog(@"_milkflakeArray = %d",_milkflakeArray.count);
        
        _flowerteaArray = [dic objectForKeyedSubscript:@"flower_tea"];
        NSLog(@"_flowerteaArray = %d",_flowerteaArray.count);
        
        _cakeArray = [dic objectForKeyedSubscript:@"cake"];
        NSLog(@"_cakeArray = %d",_cakeArray.count);
        
    }else
        NSLog(@"error while deserializing the JSON data !");
    
    
    
}

@end
