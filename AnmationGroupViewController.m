//
//  AnmationGroupViewController.m
//  动画
//
//  Created by TianWan on 2017/1/12.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "AnmationGroupViewController.h"

@interface AnmationGroupViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;

@end

@implementation AnmationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"animationGroup";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"animation" style:UIBarButtonItemStylePlain target:self action:@selector(animation)];
}

- (void)animation
{
    [self group];
}

- (void)group
{
    // 大小
    CABasicAnimation *scale1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale1.fromValue = @(0);
    scale1.toValue = @(1.5);
    
    // 旋转
    CABasicAnimation *rotationx = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    [rotationx setFromValue:@(M_PI)];
    [rotationx setToValue:@(0)];
    
    CABasicAnimation *rotationz = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotationz setFromValue:@(M_PI)];
    [rotationz setToValue:@(0)];
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    [group setDuration:0.5];
    [group setAnimations:@[scale1,rotationx,rotationz]];
    
    [group setFillMode:kCAFillModeForwards];
    group.removedOnCompletion = NO;
//    [group setAnimations:@[scale]];
    
    [self.cat.layer addAnimation:group forKey:nil];
    
}


@end
