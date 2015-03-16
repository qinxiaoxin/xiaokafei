//
//  DetailViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/8/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "DetailViewController.h"
#import "LIstViewController.h"
#import "ImageViewBorder.h"

@interface DetailViewController (){
    int a;
}

@property (weak, nonatomic) IBOutlet UILabel *appTipLable;

@property (strong, nonatomic) ImageViewBorder *imageView;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - initView

- (void)initView
{
    _appTipLable.alpha = 0.f;
    
    a = 0;
    
    //UIImageIVew
    UIImage *image = [UIImage imageNamed:@"IMG_2088.JPG"];
    
    _imageView = [[ImageViewBorder alloc] initWithImage:image];
    _imageView.frame = CGRectMake(self.view.center.x - RECTANGLE_WIDTH / 2, self.view.center.y - RECTANGLE_HEIGHT / 2, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
}


#pragma mark - Navigation

- (void)prepareListViewController:(LIstViewController *)lvc toArray:(NSArray *)array
{
    lvc.array = array;
    lvc.offset = self.offset;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Detail_List"]) {
        if ([segue.destinationViewController isKindOfClass:[LIstViewController class]]) {
            [self prepareListViewController:segue.destinationViewController toArray:self.aArray];
        }
    }
}


#pragma mark - Action

- (IBAction)orderAction:(id)sender
{
    if (a == 10) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:nil message:@"Opppsssss......您是大胃王" delegate:self cancelButtonTitle:@"擦" otherButtonTitles:nil, nil];
        [av show];
        return;
    }
    
    a++;
    NSString *order = [NSString stringWithFormat:@"+%d",a];
    _appTipLable.text = order;

     _appTipLable.alpha = 1.f;
     [UIView animateWithDuration:0.5f animations:^{
         _appTipLable.alpha = 0.f;
     } completion:^(BOOL finished) {
         
     }];
}


@end
