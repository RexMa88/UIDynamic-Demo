//
//  MCTableViewController.m
//  DynamicProject
//
//  Created by Rex Ma on 15/12/13.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import "MCTableViewController.h"

static NSString * const cellIdentifier = @"CellIdentifier";

@interface MCTableViewController ()

@property (nonatomic, strong) NSArray * titles;//title Array
@property (nonatomic, strong) NSArray * VCArray;//VCArray

@end

@implementation MCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"Gravity",@"Collision",@"Attachment",@"Snap",@"Push"];
    self.VCArray = @[@"MCGravityViewController",@"MCCollisionViewController"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [self configureCell:cell indexPath:indexPath];//configure cell
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = self.titles[indexPath.row];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * classString = self.VCArray[indexPath.row];
    Class controllerClass = NSClassFromString(classString);
    if (controllerClass) {
        UIViewController * controller = controllerClass.new;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
