//
//  TableViewEditViewController.m
//  动画
//
//  Created by TianWan on 22/01/2017.
//  Copyright © 2017 tianwan. All rights reserved.
//

#import "TableViewEditViewController.h"

@interface TableViewEditViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_array;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"tableView 编辑模式";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(delete)];
    
    _array = [NSMutableArray array];
    for (NSInteger i = 0; i < 30; i ++) {
        [_array addObject:[NSString stringWithFormat:@"gaobo%ld",i]];
    }
    [self.tableView reloadData];
}



- (void)add
{
    [self.tableView setTag:UITableViewCellEditingStyleInsert];
    BOOL edit = self.tableView.editing;
    [self.tableView setEditing:!edit animated:YES];
}

- (void)delete
{
    [self.tableView setTag:UITableViewCellEditingStyleDelete];
    BOOL edit = self.tableView.editing;
    [self.tableView setEditing:!edit animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.tag;
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

#pragma mark 编辑模式
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSIndexPath *newPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        [_array insertObject:@"new data" atIndex:indexPath.row + 1];
        [tableView insertRowsAtIndexPaths:@[newPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}

#pragma mark 移动单元格
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
//    NSLog(@"%ld,%ld",(long)sourceIndexPath.row,(long)destinationIndexPath.row);
//    [_array exchangeObjectAtIndex:sourceIndexPath.row + 1 withObjectAtIndex:destinationIndexPath.row];
//    NSLog(@"%@",_array);
    
    NSString *data = _array[sourceIndexPath.row];
    [_array removeObjectAtIndex:sourceIndexPath.row];
    [_array insertObject:data atIndex:destinationIndexPath.row];
    
     NSLog(@"%@",_array);
}


@end
