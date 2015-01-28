//
//  AppDelegate.h
//  xiaokafei
//
//  Created by Xin Qin on 12/21/14.
//  Copyright (c) 2014 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSArray *coffeeArray;
@property (nonatomic, strong) NSArray *foodArray;
@property (nonatomic, strong) NSArray *drinkArray;
@property (nonatomic, strong) NSArray *juiceArray;
@property (nonatomic, strong) NSArray *cakeArray;
@property (nonatomic, strong) NSArray *milkteaArray;
@property (nonatomic, strong) NSArray *milkflakeArray;
@property (nonatomic, strong) NSArray *flowerteaArray;

@end


@protocol ListViewButtonProtocol <NSObject>

@required
- (void)listViewButtonClick:(NSString *)title;

@end

