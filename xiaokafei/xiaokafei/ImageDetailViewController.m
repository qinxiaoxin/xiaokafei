//
//  ImageDetailViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 7/14/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _imageView.image = _image;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSelfOnTap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark - Handle Tap Genture Reconizer

- (void)dismissSelfOnTap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
