//
//  Quart2DViewController.m
//  动画
//
//  Created by TianWan on 2017/1/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "Quart2DViewController.h"
#import "BaseDrawViewController.h"
@interface Quart2DViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_menu;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation Quart2DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Quart2D";
    
    _menu = @[@"Base drawRect"];
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
        BaseDrawViewController *controller = [[BaseDrawViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}


@end
