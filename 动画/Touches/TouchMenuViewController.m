//
//  TouchMenuViewController.m
//  动画
//
//  Created by TianWan on 2017/1/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "TouchMenuViewController.h"
#import "TouchBaseViewController.h"
#import "MultiTouchViewController.h"
#import "RightSwipeMenuViewController.h"
@interface TouchMenuViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_menu;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TouchMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _menu = @[@"Base",@"MultiTouch",@"RightSwipeMenu"];
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
        TouchBaseViewController *controller = [[TouchBaseViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1) {
        MultiTouchViewController *controller = [[MultiTouchViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 2) {
        RightSwipeMenuViewController *controller = [[RightSwipeMenuViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
