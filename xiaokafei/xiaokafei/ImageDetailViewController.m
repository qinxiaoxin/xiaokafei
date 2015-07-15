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
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tipImageView;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //set image view
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    _imageView.layer.shadowOffset = CGSizeMake(0, 0);
    _imageView.layer.shadowOpacity = 0.8f;
    _imageView.layer.shadowRadius = SHADOW_RADIUS;
    _imageView.image = _image;
    
    //set image view border
    float widthRatio = _imageView.bounds.size.width / _imageView.image.size.width;
    float heightRatio = _imageView.bounds.size.height / _imageView.image.size.height;
    float scale = MIN(widthRatio, heightRatio);
    float imageWidth = scale * _imageView.image.size.width;
    float imageHeight = scale * _imageView.image.size.height;
    UIView *imageViewBorder = [[UIView alloc] initWithFrame:CGRectMake(_imageView.center.x - imageWidth / 2 - RECTANGLE_BORDER_WIDTH, _imageView.center.y - imageHeight / 2 - RECTANGLE_BORDER_WIDTH, imageWidth + RECTANGLE_BORDER_WIDTH, imageHeight + RECTANGLE_BORDER_WIDTH)];
    imageViewBorder.layer.borderWidth = RECTANGLE_BORDER_WIDTH;
    imageViewBorder.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:imageViewBorder];
    
    //set name label
    _nameLabel.text = _name;
    
    //set price label
    _priceLabel.text = _price;
    
    //set tip order image view
    _tipImageView.alpha = 0.f;
    
    //add view gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSelfOnTap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark - Handle Tap Genture Reconizer

- (void)dismissSelfOnTap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - Action

- (IBAction)orderAction:(UIButton *)sender {
    _tipImageView.alpha = 1.f;
    [UIView animateWithDuration:1.5f animations:^{
        _tipImageView.alpha = 0.f;
    } completion:^(BOOL finished) {
        //创建字典
        NSDictionary *dic = @{@"name":_name,@"price":_price};
        debugLog(@"dic = %@",dic);
        //插入到db
        FMDBService *dbService = [[FMDBService alloc] init];
        [dbService insertData:dic];
    }];
}

@end
