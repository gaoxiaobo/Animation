//
//  HomeViewController.m
//  动画
//
//  Created by gaobo on 2016/12/25.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "HomeViewController.h"
#import "RepaetViewController.h"
#import "SpringViewController.h"
#import "RotationViewController.h"
#import "HiddenAnimationViewController.h"
#import "BaseAnimationViewController.h"
#import "AlertViewAnimationViewController.h"
#import "AnmationGroupViewController.h"
#import "KeyAnimationsViewController.h"
#import "CATransitionViewController.h"
@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_array;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"animation";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _array = @[@"Repaet",@"Spring",@"Roration",@"Hidden animation",@"base animation",@"AnimationGroup",@"alertViewAnimation",@"keyAnimation",@"CATransition"];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //NO关闭动画效果
    switch (indexPath.row) {
        case 0: {
            RepaetViewController *controller = [[RepaetViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 1: {
            SpringViewController *controller = [[SpringViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 2: {
            RotationViewController *controller = [[RotationViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 3: {
            HiddenAnimationViewController *controller = [[HiddenAnimationViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 4: {
            BaseAnimationViewController *controller = [[BaseAnimationViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 5: {
            AnmationGroupViewController *controller = [[AnmationGroupViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 6: {
            AlertViewAnimationViewController *controller = [[AlertViewAnimationViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 7: {
            KeyAnimationsViewController *controller = [[KeyAnimationsViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        case 8: {
            CATransitionViewController *controller = [[CATransitionViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
