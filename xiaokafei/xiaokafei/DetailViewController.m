//
//  DetailViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/8/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "DetailViewController.h"
#import "LIstViewController.h"

@interface DetailViewController (){
    int a;
}

@property (weak, nonatomic) IBOutlet UILabel *appTipLable;

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIView *imageViewBorder;

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
    if (![self.aImageStr isEqualToString:@""]){
        UIImage *image = [UIImage imageNamed:_aImageStr];
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.frame = CGRectMake(self.view.center.x - RECTANGLE_WIDTH / 2, self.view.center.y - RECTANGLE_HEIGHT / 2, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.layer.shadowColor = [UIColor blackColor].CGColor;
        _imageView.layer.shadowOffset = CGSizeMake(0, 0);
        _imageView.layer.shadowOpacity = 0.8f;
        _imageView.layer.shadowRadius = SHADOW_RADIUS;
        [self.view addSubview:_imageView];
        
        //计算出ImageView 中填充内容的长、高
        float widthRatio = _imageView.bounds.size.width / _imageView.image.size.width;
        float heightRatio = _imageView.bounds.size.height / _imageView.image.size.height;
        float scale = MIN(widthRatio, heightRatio);
        float imageWidth = scale * _imageView.image.size.width;
        float imageHeight = scale * _imageView.image.size.height;
        _imageViewBorder = [[UIView alloc] initWithFrame:CGRectMake(_imageView.center.x - imageWidth / 2 - RECTANGLE_BORDER_WIDTH, _imageView.center.y - imageHeight / 2 - RECTANGLE_BORDER_WIDTH, imageWidth + RECTANGLE_BORDER_WIDTH, imageHeight + RECTANGLE_BORDER_WIDTH)];
        _imageViewBorder.layer.borderWidth = RECTANGLE_BORDER_WIDTH;
        _imageViewBorder.layer.borderColor = [UIColor blackColor].CGColor;
        [self.view addSubview:_imageViewBorder];
    }
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
