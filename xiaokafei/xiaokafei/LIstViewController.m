//
//  LIstViewController.m
//  xiaokafei
//
//  Created by Xin Qin on 1/7/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "LIstViewController.h"
#import "DetailViewController.h"

@interface LIstViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LIstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareImageViewController:(DetailViewController *)dvc toDisplayPhoto:(NSDictionary *)dictionary
{
    dvc.title = [dictionary valueForKeyPath:@"name"];
//    ivc.imageURL = [FlickrFetcher URLforPhoto:dictionary format:FlickrPhotoFormatLarge];

}

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"List_Detail"]) {
                if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]) {
                    [self prepareImageViewController:segue.destinationViewController toDisplayPhoto:self.array[indexPath.row]];
                }
            }
        }
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *dic = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic valueForKeyPath:@"name"];
    cell.backgroundColor = [UIColor colorWithRed:51 / 255.f green:51 / 255.f blue:51 / 255.f alpha:1.f];
    return cell;
}

@end
