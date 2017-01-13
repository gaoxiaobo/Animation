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
@interface MenuViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_menu;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _menu = @[@"Animation",@"Quart2D",@"Touches"];
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
    }else {
        TouchMenuViewController *controller = [[TouchMenuViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}



@end
