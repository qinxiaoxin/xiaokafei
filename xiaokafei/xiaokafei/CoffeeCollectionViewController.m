//
//  CoffeeCollectionViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 7/13/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "CoffeeCollectionViewController.h"
#import "ModelCollectionViewCell.h"

@interface CoffeeCollectionViewController ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation CoffeeCollectionViewController

static NSString * const reuseIdentifier = @"ModelCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"ModelCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    _array = (NSArray *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).coffeeArray;
    
    self.collectionView.backgroundColor = RGBA(30, 30, 30, 1);
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //#warning Incomplete method implementation -- Return the number of items in the section
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ModelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSDictionary *dic = [_array objectAtIndex:indexPath.row];
    
    __block YYImage *image;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        image = [YYImage imageNamed:[dic valueForKeyPath:@"image"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.indicator stopAnimating];
            cell.imageView.image = image;
        });
    });
    
    NSString *name = [dic valueForKeyPath:@"name"];
    cell.nameLabel.text = name;
    
    NSString *price = [dic valueForKeyPath:@"price"];
    cell.priceLabel.text = price;
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModelCollectionViewCell *cell = (ModelCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];

    TAlertView *alert = [[TAlertView alloc] initWithTitle:nil
                                                  message:[NSString stringWithFormat:@"%@，%@，加入哪一桌的餐单？",cell.nameLabel.text,cell.priceLabel.text]
                                                  buttons:@[@"1桌", @"2桌", @"3桌", @"4桌", @"5桌", @"6桌"]
                                              andCallBack:^(TAlertView *alertView, NSInteger buttonIndex) {
//                                                  NSLog(@"%lu",(long)buttonIndex);
                                                  [self operationFmdb:buttonIndex name: cell.nameLabel.text price: cell.priceLabel.text];
                                              }];
    alert.buttonsAlign = TAlertViewButtonsAlignHorizontal;
    [alert showAsMessage];
}

- (void)operationFmdb:(NSInteger)buttonIndex name: (NSString*)name price: (NSString*)price
{
    //创建字典
    NSDictionary *dic = @{@"name":name,@"price":price};
//    debugLog(@"dic = %@",dic);
    
    //插入到db
    FMDBService *dbService = [[FMDBService alloc] init];
    [dbService insertData:dic tableTag:buttonIndex];
}


@end
