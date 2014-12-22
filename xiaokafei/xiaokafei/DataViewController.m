//
//  DataViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 12/21/14.
//  Copyright (c) 2014 Xin Qin. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSDictionary *dic = (NSDictionary *)self.dataObject;
    NSString *name = [dic objectForKeyedSubscript:@"name"];
    self.dataLabel.text = name;
}

@end
