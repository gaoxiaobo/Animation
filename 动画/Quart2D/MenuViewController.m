//
//  MenuViewController.m
//  动画
//
//  Created by TianWan on 2017/1/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
#import "Quart2DViewController.h"
#import "TouchMenuViewController.h"
#import "DynamicViewController.h"
#import "TableViewMenuController.h"
#import "TableViewEditViewController.h"
#import "ScrollViewViewController.h"
#import "GoogleLoadingViewController.h"
#import "AssociatedObjectViewController.h"
@interface MenuViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_menu;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _menu = @[@"Animation",@"Quart2D",@"Touches",@"UIDynamic",@"TableView",@"TableViewEdit",@"ScrollView",@"googleLoading",@"AssociatedObject"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _menu[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        HomeViewController *controller = [[HomeViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1){
        Quart2DViewController *controller = [[Quart2DViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 2){
        TouchMenuViewController *controller = [[TouchMenuViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 3){
        DynamicViewController *controller = [[DynamicViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 4) {
        TableViewMenuController *controller = [[TableViewMenuController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 5) {
        TableViewEditViewController *controller = [[TableViewEditViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 6) {
        ScrollViewViewController *controller = [[ScrollViewViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 7) {
        GoogleLoadingViewController *controller = [[GoogleLoadingViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 8) {
        AssociatedObjectViewController *controller = [[AssociatedObjectViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}



@end
