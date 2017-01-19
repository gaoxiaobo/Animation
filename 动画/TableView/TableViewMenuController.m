//
//  TableViewMenuController.m
//  动画
//
//  Created by TianWan on 2017/1/19.
//  Copyright © 2017年 tianwan. All rights reserved.
//
#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight  [UIScreen mainScreen].bounds.size.height
#import "TableViewMenuController.h"
#import "CustomTableViewCell.h"
@interface TableViewMenuController () <UIScrollViewDelegate>
{
    NSMutableArray *_menu;
}

@end

@implementation TableViewMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _menu = [NSMutableArray array];
    for (NSInteger i = 0; i < 50; i ++) {
        NSString *str = [NSString stringWithFormat:@"第%ld行",i];
        [_menu addObject:str];
    }
    [self.tableView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getRect" object:nil];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _menu.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableViewCell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    cell.tableView = tableView;
    cell.indexPath = indexPath;
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = _menu[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
        CGRect rect = [tableView convertRect:rectInTableView toView:[tableView superview]];
        NSLog(@"rect:%@",NSStringFromCGRect(rect));
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CAKeyframeAnimation * animation;
    
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = 0.5;
    
    //    animation.delegate = self;
    
    animation.removedOnCompletion = YES;
    
    animation.fillMode = kCAFillModeForwards;
    
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.1, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    
    [cell.layer addAnimation:animation forKey:nil];
    
    if (indexPath.row == 0) {
        CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
        CGRect rect = [tableView convertRect:rectInTableView toView:[tableView superview]];
        NSLog(@"rect:%@",NSStringFromCGRect(rect));
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  200;
}



@end
