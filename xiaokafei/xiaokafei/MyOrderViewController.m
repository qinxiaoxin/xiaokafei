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

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *table1Button;
@property (weak, nonatomic) IBOutlet UIButton *table2Button;
@property (weak, nonatomic) IBOutlet UIButton *table3Button;
@property (weak, nonatomic) IBOutlet UIButton *table4Button;
@property (weak, nonatomic) IBOutlet UIButton *table5Button;
@property (weak, nonatomic) IBOutlet UIButton *table6Button;

@property (strong, nonatomic) NSArray *buttonArray;
@property (strong, nonatomic) NSMutableArray *dbArray;
@property (strong, nonatomic) FMDBService *dbService;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //bg color
    self.view.backgroundColor = RGBA(232, 222, 204, 1);
    
    //default button selected
    _table1Button.selected = true;
    
    //operate db
    _dbService = [[FMDBService alloc] init];
    _dbArray = [_dbService queryData:0];
    
    if (_dbArray) {
        //reload table view
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView reloadData];
    }
    
    //decorate button to array
    _buttonArray = @[_table1Button,_table2Button,_table3Button,_table4Button,_table5Button,_table6Button];
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
    prepareDeleteArrayIndex = indexPath.row;
    NSDictionary *dic = [self.dbArray objectAtIndex:prepareDeleteArrayIndex];
    NSString *name = [dic valueForKeyPath:@"name"];
    NSString *avString = [NSString stringWithFormat:@"delete the %@ ？",name];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Tip" message:avString delegate:self cancelButtonTitle:@"no" otherButtonTitles:@"yes", nil];
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
        for (UIButton *button in _buttonArray) {
            if (button.selected == true) {
                NSDictionary *dic = [self.dbArray objectAtIndex:prepareDeleteArrayIndex];
                NSString *name = [dic valueForKeyPath:@"name"];
                [_dbService deleteData:name tableTag:button.tag];
                self.dbArray = [_dbService queryData:button.tag];
                [self.tableView reloadData];
            }
        }
    }
}



#pragma mark - Action

- (IBAction)clearOrder:(id)sender
{
    for(UIButton *button in _buttonArray) {
        if (button.selected == true) {
            [_dbService clearAllData:button.tag];
            _dbArray = [_dbService queryData:button.tag];
            [self.tableView reloadData];
        }
    }
}

- (IBAction)table1Action:(id)sender {
    _table1Button.selected = true;
    _table2Button.selected = false;
    _table3Button.selected = false;
    _table4Button.selected = false;
    _table5Button.selected = false;
    _table6Button.selected = false;
    _dbArray = [_dbService queryData:0];
    [self.tableView reloadData];
    
}
- (IBAction)table2Action:(id)sender {
    _table1Button.selected = false;
    _table2Button.selected = true;
    _table3Button.selected = false;
    _table4Button.selected = false;
    _table5Button.selected = false;
    _table6Button.selected = false;
    _dbArray = [_dbService queryData:1];
    [self.tableView reloadData];
}
- (IBAction)table3Action:(id)sender {
    _table1Button.selected = false;
    _table2Button.selected = false;
    _table3Button.selected = true;
    _table4Button.selected = false;
    _table5Button.selected = false;
    _table6Button.selected = false;
    _dbArray = [_dbService queryData:2];
    [self.tableView reloadData];
}
- (IBAction)table4Action:(id)sender {
    _table1Button.selected = false;
    _table2Button.selected = false;
    _table3Button.selected = false;
    _table4Button.selected = true;
    _table5Button.selected = false;
    _table6Button.selected = false;
    _dbArray = [_dbService queryData:3];
    [self.tableView reloadData];
}
- (IBAction)table5Action:(id)sender {
    _table1Button.selected = false;
    _table2Button.selected = false;
    _table3Button.selected = false;
    _table4Button.selected = false;
    _table5Button.selected = true;
    _table6Button.selected = false;
    _dbArray = [_dbService queryData:4];
    [self.tableView reloadData];
}
- (IBAction)table6Action:(id)sender {
    _table1Button.selected = false;
    _table2Button.selected = false;
    _table3Button.selected = false;
    _table4Button.selected = false;
    _table5Button.selected = false;
    _table6Button.selected = true;
    _dbArray = [_dbService queryData:5];
    [self.tableView reloadData];
}


@end
