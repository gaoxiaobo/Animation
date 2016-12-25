//
//  CABasicAnimationViewController.m
//  动画
//
//  Created by gaobo on 2016/12/21.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *bose;
@property (weak, nonatomic) IBOutlet UIView *cat;

@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"ANI" style:UIBarButtonItemStylePlain target:self action:@selector(position)];
}

- (void)position {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
    ani.toValue = [NSValue valueWithCGPoint:self.bose.center];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    ani.beginTime = 1.0F;
//    ani.duration = 1.0F;
    ani.delegate = self;
    [self.cat.layer addAnimation:ani forKey:@"PostionAni"];
}

- (IBAction)x:(id)sender
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
    ani.toValue = [NSValue valueWithCGPoint:self.bose.center];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    ani.beginTime = 1.0F;
    //    ani.duration = 1.0F;
    ani.delegate = self;
    [self.cat.layer addAnimation:ani forKey:@"PostionAni"];
}

- (IBAction)y:(id)sender
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position.y"];
    ani.toValue = [NSValue valueWithCGPoint:self.bose.center];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    ani.beginTime = 1.0F;
    //    ani.duration = 1.0F;
    ani.delegate = self;
    [self.cat.layer addAnimation:ani forKey:@"PostionAni"];
}

- (IBAction)rotation:(id)sender
{
    CABasicAnimation *ani = [self rotation:1.0f angle:M_PI z:90 repeatCount:1];
//    ani.fromValue = [NSValue valueWithCGRect:CGRectMake(0,0,10,10)];
//    ani.toValue = [NSValue valueWithCGRect:CGRectMake(10,10,200,200)];
//    ani.removedOnCompletion = NO;
//    ani.fillMode = kCAFillModeForwards;
//    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    //    ani.beginTime = 1.0F;
//        ani.duration = 5.0F;
//    ani.delegate = self;
    [self.bose.layer addAnimation:ani forKey:@"bounds"];
}

/// degree
- (CABasicAnimation *)rotation:(float)dur angle:(float)angle z:(int)z repeatCount:(int)repeatCount //旋转
{
    CATransform3D rotationTransform  = CATransform3DMakeRotation(angle, 90, 0, 0);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration= dur;
    animation.autoreverses= NO;
    animation.cumulative= YES;
    animation.removedOnCompletion= YES;
    animation.fillMode=kCAFillModeForwards;
    animation.repeatCount= repeatCount;
    animation.delegate= self;
    
    return animation;
}

- (CABasicAnimation *)opacityForever_Animation:(float)time //永久闪烁的动画
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.0];
    animation.autoreverses=YES;
    animation.duration=time;
    animation.repeatCount=FLT_MAX;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

- (IBAction)rotationx:(id)sender {
}
- (IBAction)rotationY:(id)sender {
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"start");
}
- (IBAction)rotationZ:(id)sender {
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"end");
}

@end
