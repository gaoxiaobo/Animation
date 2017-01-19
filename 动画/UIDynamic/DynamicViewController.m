//
//  DynamicViewController.m
//  动画
//
//  Created by TianWan on 2017/1/16.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "DynamicViewController.h"
#import "DynamicBaseViewController.h"
#import "SnapViewController.h"
#import "AttachmentViewController.h"
#import "SpringAttachmentViewController.h"
@interface DynamicViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_menu;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dynamic";
    _menu = @[@"DynamicBase",@"Snap",@"Attachment",@"springAttachment"];
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
        DynamicBaseViewController *controller = [[DynamicBaseViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1) {
        SnapViewController *controller = [[SnapViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 2) {
        AttachmentViewController *controller = [[AttachmentViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 3) {
        SpringAttachmentViewController *controller = [[SpringAttachmentViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
