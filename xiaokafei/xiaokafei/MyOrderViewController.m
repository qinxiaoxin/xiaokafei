//
//  MyOrderViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 3/17/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "MyOrderViewController.h"
#import "TotalView.h"

@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    NSInteger prepareDeleteArrayIndex;
}

@property (nonatomic, strong) NSMutableArray *dbArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) FMDBService *dbService;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //
    self.view.backgroundColor = RGBA(232, 222, 204, 1);
    
    //operate db
    _dbService = [[FMDBService alloc] init];
    _dbArray = [_dbService queryData];
    
    if (_dbArray) {
        //reload table view
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CCMPlayNDropViewDelegate

- (void)CCMPlayNDropViewWillStartDismissAnimationWithDynamics:(CCMPlayNDropView *)view{
    self.view.superview.userInteractionEnabled = NO;
    self.view.userInteractionEnabled = NO;
}

- (void)CCMPlayNDropViewDidFinishDismissAnimationWithDynamics:(CCMPlayNDropView *)view{
    self.view.superview.userInteractionEnabled = YES;
    CGRect frame = self.view.frame;
    frame.origin.y = -1000;
    self.view.frame = frame;
    [self.parentViewController dismissCurrentPopinControllerAnimated:YES];
    
}


#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

    return self.dbArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"ListCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *dic = [self.dbArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic valueForKeyPath:@"name"];
    cell.textLabel.font = [UIFont fontWithName:Font size:20.f];
    cell.detailTextLabel.text = [dic valueForKeyPath:@"price"];
    cell.detailTextLabel.font = [UIFont fontWithName:Font size:20.f];
    
    return cell;
}



#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    debugMethod();
    prepareDeleteArrayIndex = indexPath.row;
    NSDictionary *dic = [self.dbArray objectAtIndex:prepareDeleteArrayIndex];
    NSString *name = [dic valueForKeyPath:@"name"];
    NSString *avString = [NSString stringWithFormat:@"删除 %@ ？",name];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:nil message:avString delegate:self cancelButtonTitle:@"no" otherButtonTitles:@"yes", nil];
    [av show];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    TotalView *tv = [[TotalView alloc] init];
    
    NSInteger priceTotal = 0;
    
    if (self.dbArray.count > 0) {
        for (int i = 0; i < self.dbArray.count; i++) {
            NSDictionary *dic = [self.dbArray objectAtIndex:i];
            NSString *price = [dic valueForKeyPath:@"price"];
            NSString *priceStr = [price substringFromIndex:1];
            NSInteger priceInt = [priceStr intValue];
            priceTotal += priceInt;
        }
        
        
        NSString *priceTotalStr = [NSString stringWithFormat:@"%ld",(long)priceTotal];
        NSString *totalPriceLabelText = [@"¥" stringByAppendingString:priceTotalStr];
        debugLog(@"%@",totalPriceLabelText);
        tv.totalPriceLabel.text = totalPriceLabelText;
        [tv setNeedsDisplay];
        
    }else{
        tv.totalPriceLabel.text = @"¥0";
        [tv setNeedsDisplay];
    }

    return tv;
}



#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        return;
    }else{
        NSDictionary *dic = [self.dbArray objectAtIndex:prepareDeleteArrayIndex];
        NSString *name = [dic valueForKeyPath:@"name"];
        _dbService = [[FMDBService alloc] init];
        [_dbService deleteData:name];
        self.dbArray = [_dbService queryData];
        [self.tableView reloadData];
    }
}



#pragma mark - Action

- (IBAction)clearOrder:(id)sender
{
    [_dbService clearAllData];
    _dbArray = [_dbService queryData];
    [self.tableView reloadData];
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
