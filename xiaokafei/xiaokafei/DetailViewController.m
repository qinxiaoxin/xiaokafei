//
//  DetailViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/8/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "DetailViewController.h"
#import "LIstViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleLabel.text = self.aTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareListViewController:(LIstViewController *)lvc toDisplayArray:(NSArray *)array
{
    lvc.array = array;
    lvc.offset = self.offset;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Detail_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toDisplayArray:self.aArray];
        }
    }
}


@end
