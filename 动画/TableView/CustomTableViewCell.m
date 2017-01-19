//
//  CustomTableViewCell.m
//  动画
//
//  Created by TianWan on 2017/1/19.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getRect) name:@"getRect" object:nil];
    
}

- (void)getRect
{
    if (self.indexPath.row == 0) {
        CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:self.indexPath];
        CGRect rect = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
        NSLog(@"%@",NSStringFromCGRect(rect));
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
