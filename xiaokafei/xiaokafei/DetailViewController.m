//
//  DetailViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/8/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "DetailViewController.h"
#import "LIstViewController.h"
#import "BigImageViewController.h"

@interface DetailViewController (){
    int a;
}

@property (weak, nonatomic) IBOutlet UILabel *appTipLable;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) RCDraggableButton *avatar;

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
    
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.aArray.count, 0);
    _scrollView.scrollEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < self.aArray.count; i++) {
        NSDictionary *dic = [self.aArray objectAtIndex:i];
        NSString *imageStr = [dic valueForKeyPath:@"image"];
        if (![imageStr isEqualToString:@""]){
            UIImage *image = [UIImage imageNamed:imageStr];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(SCREEN_WIDTH * i + self.view.center.x - RECTANGLE_WIDTH / 2, self.view.center.y - RECTANGLE_HEIGHT / 2, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.layer.shadowColor = [UIColor blackColor].CGColor;
            imageView.layer.shadowOffset = CGSizeMake(0, 0);
            imageView.layer.shadowOpacity = 0.8f;
            imageView.layer.shadowRadius = SHADOW_RADIUS;
            [self.scrollView addSubview:imageView];
            
            //计算出ImageView 中填充内容的长、高
            float widthRatio = imageView.bounds.size.width / imageView.image.size.width;
            float heightRatio = imageView.bounds.size.height / imageView.image.size.height;
            float scale = MIN(widthRatio, heightRatio);
            float imageWidth = scale * imageView.image.size.width;
            float imageHeight = scale * imageView.image.size.height;
            UIView *imageViewBorder = [[UIView alloc] initWithFrame:CGRectMake(imageView.center.x - imageWidth / 2 - RECTANGLE_BORDER_WIDTH, imageView.center.y - imageHeight / 2 - RECTANGLE_BORDER_WIDTH, imageWidth + RECTANGLE_BORDER_WIDTH, imageHeight + RECTANGLE_BORDER_WIDTH)];
            imageViewBorder.tag = i;
            imageViewBorder.layer.borderWidth = RECTANGLE_BORDER_WIDTH;
            imageViewBorder.layer.borderColor = [UIColor blackColor].CGColor;
            imageViewBorder.userInteractionEnabled = YES;
            [imageViewBorder addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBigImageView:)]];
            [self.scrollView addSubview:imageViewBorder];
        }
    }
    
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * self.tag, 0);
    
    [self myOrderButton];
}

- (void)myOrderButton
{
    _avatar = [[RCDraggableButton alloc] initInView:self.view WithFrame:CGRectMake(0, 0, MY_ORDER_BUTTON_DIAMETER, MY_ORDER_BUTTON_DIAMETER)];
    _avatar.frame = self.myOrderOffset;
    [_avatar setBackgroundImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
    [_avatar setAutoDocking:NO];
    
    _avatar.longPressBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  LongPress!!! ===");
        //More todo here.
        
    };
    
    _avatar.tapBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  Tap!!! ===");
        //More todo here.
        
    };
    
    _avatar.draggingBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === Dragging!!! ===");
        //More todo here.
        
    };
    
    _avatar.dragDoneBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === DragDone!!! ===");
        //More todo here.
        
    };
    
    _avatar.autoDockingBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === AutoDocking!!! ===");
        //More todo here.
        
    };
    
    _avatar.autoDockingDoneBlock = ^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === AutoDockingDone!!! ===");
        //More todo here.
        
    };
}


- (void)showBigImageView:(id)sender
{
    NSDictionary *dic = [self.aArray objectAtIndex:[sender view].tag];
    NSString *imageStr = [dic valueForKeyPath:@"image"];
    
    BigImageViewController *bivc = [[BigImageViewController alloc] init];
    bivc.image = [UIImage imageNamed:imageStr];
    [self presentViewController:bivc animated:YES completion:^{
        
    }];
}


#pragma mark - Navigation

- (void)prepareListViewController:(LIstViewController *)lvc toArray:(NSArray *)array
{
    lvc.array = array;
    lvc.offset = self.offset;
    lvc.myOrderOffset = _avatar.frame;
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
