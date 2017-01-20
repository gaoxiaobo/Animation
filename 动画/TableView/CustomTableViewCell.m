//
//  CustomTableViewCell.m
//  动画
//
//  Created by TianWan on 2017/1/19.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight  [UIScreen mainScreen].bounds.size.height
#import "CustomTableViewCell.h"

@interface CustomTableViewCell()
{
    UIImageView *_imageView;
}

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getRect) name:@"getRect" object:nil];
    
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    _imageView.frame = CGRectMake(0, 0, kUIScreenWidth, kUIScreenWidth * 2/3);
    NSString *imageName = [NSString stringWithFormat:@"%u.jpg",arc4random_uniform(9)+1];
    _imageView.image = [UIImage imageNamed:imageName];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
}

- (void)getRect
{
    CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:self.indexPath];
    CGRect rect = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
    NSLog(@"%@",NSStringFromCGRect(rect));
    
    CGFloat center = rect.origin.y + rect.size.height/2;
    
    CGFloat Y = fabs(center - kUIScreenHeight/2);
    NSLog(@"Y:%f",Y);
    if (Y > 200) {
        if (Y > 400) {
            Y = 400;
        }
        CGFloat scale = 1 - ((Y - 150)/250.0) * 0.05;
        NSLog(@"scale:%f",scale);
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.duration = 0.1;
        animation.toValue = @(scale);
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [_imageView.layer addAnimation:animation forKey:nil];
    }else {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.duration = 0.1;
        animation.toValue = @(1.0);
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [_imageView.layer addAnimation:animation forKey:nil];
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
