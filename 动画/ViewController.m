//
//  ViewController.m
//  动画
//
//  Created by gaobo on 2016/12/21.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController () <CAAnimationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.delegate = self;
    ani.duration = 5.0f;
    ani.repeatCount = 1;
//    ani.timingFunction =
    
    CAMediaTimingFunction *f = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    ani.timingFunction = f;
    
}

//- (void)position {
//    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"position"];
//    ani.toValue = [NSValue valueWithCGPoint:self.centerShow.center];
//    ani.removedOnCompletion = NO;
//    ani.fillMode = kCAFillModeForwards;
//    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [self.cartCenter.layer addAnimation:ani forKey:@"PostionAni"];
//}

- (void)animationDidStart:(CAAnimation *)anim
{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
}

@end
