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
    
    NSString *img = [dic valueForKeyPath:@"image"];
    if ([img isEqualToString:@"default"]) {
        cell.imageView.image = [UIImage imageNamed:@"default"];
    }else{
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager diskImageExistsForURL:[NSURL URLWithString:img] completion:^(BOOL isInCache) {
            cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:img]];
        }];
    }
    
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
    [_delegate goToImageDeatail:cell.imageView.image];
}


@end