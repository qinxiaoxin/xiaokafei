//
//  ListDetailViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 12/26/14.
//  Copyright (c) 2014 Xin Qin. All rights reserved.
//

#import "ListDetailViewController.h"

#import "ListItem.h"
#import "PJRPageScrollingView.h"

@interface ListDetailViewController ()

@end

@implementation ListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < self.pageData.count; i++) {
        NSDictionary *dic = [self.pageData objectAtIndex:i];
        ListItem *item = [[ListItem alloc] init];
        item.name = [dic objectForKeyedSubscript:@"name"];
        item.price = [dic objectForKeyedSubscript:@"price"];
        item.image = [dic objectForKeyedSubscript:@"image"];
        [array addObject:item];
    }
    
    PJRPageScrollingView *pageScrollView = [[PJRPageScrollingView alloc] initWithFrame:self.view.bounds withNumberOfItems:array];
//    pageScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:pageScrollView];
    [self.view sendSubviewToBack:pageScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
