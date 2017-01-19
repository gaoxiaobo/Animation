//
//  AlertViewAnimationViewController.m
//  动画
//
//  Created by TianWan on 2017/1/9.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "AlertViewAnimationViewController.h"

@interface AlertViewAnimationViewController () <CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIView *orange;


@end

@implementation AlertViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.orange.layer.cornerRadius = 5.0f;
    self.orange.clipsToBounds = YES;
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackOpaque];
    
    self.navigationController.navigationBar.translucent = YES;
    
    [self.navigationController.view setNeedsLayout];
    
    self.wantsFullScreenLayout = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"animation" style:UIBarButtonItemStylePlain target:self action:@selector(test)];
    
}

- (void)test

{
    
    CAKeyframeAnimation * animation;
    
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = 0.5;
    
    animation.delegate = self;
    
    animation.removedOnCompletion = YES;
    
    animation.fillMode = kCAFillModeForwards;
    
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    
    // 旋转
    CABasicAnimation *rotationx = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    [rotationx setFromValue:@(M_PI)];
    [rotationx setToValue:@(0)];
    
    CABasicAnimation *rotationz = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];   
    [rotationz setFromValue:@(M_PI)];
    [rotationz setToValue:@(0)];
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    [group setDuration:0.5];
    [group setAnimations:@[animation,rotationx,rotationz]];
    
    [group setFillMode:kCAFillModeForwards];
    group.removedOnCompletion = NO;
    //    [group setAnimations:@[scale]];
    
    
    
    [self.orange.layer addAnimation:animation forKey:nil];
}

@end
