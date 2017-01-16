//
//  DynamicBaseViewController.m
//  动画
//
//  Created by TianWan on 2017/1/16.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "DynamicBaseViewController.h"

@interface DynamicBaseViewController ()
{
    UIDynamicAnimator *_animator;
}
@property (weak, nonatomic) IBOutlet UIView *orange;
@property (weak, nonatomic) IBOutlet UIView *blue;

@end

@implementation DynamicBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIDynamic基本概念";
    [self animator];
}

- (void)animator
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 10; i ++) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(arc4random_uniform(300), arc4random_uniform(100), arc4random_uniform(100) + 1, arc4random_uniform(100) + 1);
        [self.view addSubview:view];
        CGFloat red = arc4random_uniform(255);
        CGFloat green = arc4random_uniform(255);
        CGFloat blue = arc4random_uniform(255);
        view.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
        [array addObject:view];
    }
    
    [array addObject:self.orange];
    [array addObject:self.blue];
    
    // 实例化一个animator
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 添加重力感应
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:array];
    gravity.magnitude = 0.5;
    // 将重力感应添加到animator
    [animator addBehavior:gravity];
    
    // 碰撞检测行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:array];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collision];
    
    _animator = animator;
}

@end
