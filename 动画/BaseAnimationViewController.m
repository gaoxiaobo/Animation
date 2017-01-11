//
//  BaseAnimationViewController.m
//  动画
//
//  Created by gaobo on 2016/12/29.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "BaseAnimationViewController.h"

@interface BaseAnimationViewController ()
{
    
}
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation BaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAAnimation *ani = [self.myView.layer animationForKey:@"ani"];
    if (ani) { // 是否存在该动画
       // [self.myView.layer removeAllAnimations];
        
        
        if (self.myView.layer.speed == 0) {
            [self resume];
        }else {
            [self pause];
        }
        
    }else {
        [self rotation];
    }
    
    
}

// 暂停动画
- (void)pause
{
    // 取出当前动画的时间点
    CFTimeInterval f = [self.myView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 定格动画
    [self.myView.layer setTimeOffset:f];
    
    // 停止
    [self.myView.layer setSpeed:0.0];
}

// 恢复动画
- (void)resume
{
    CFTimeInterval pauseTime = self.myView.layer.timeOffset;
    CFTimeInterval beginTime = CACurrentMediaTime() - pauseTime;
    
    [self.myView.layer setTimeOffset:0.0];
    [self.myView.layer setBeginTime:beginTime];
    [self.myView.layer setSpeed:1.0];
}

- (void)rotation
{
    // 默认是Z
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    [self.myView.layer setAnchorPoint:CGPointMake(1, 1)];
    
    [ani setToValue:@(2 * M_PI)];
    [ani setRepeatCount:HUGE_VALF];
    [ani setDuration:1.0];
    
    [self.myView.layer addAnimation:ani forKey:@"ani"];
}

- (void)rotationX
{
    // X轴
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    
    [ani setToValue:@(2 * M_PI)];
    [ani setRepeatCount:HUGE_VALF];
    [ani setDuration:0.5];
    
    [self.myView.layer addAnimation:ani forKey:@"ani"];
}

- (void)rotationY
{
    // Y轴
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    [self.myView.layer setAnchorPoint:CGPointMake(1, 1)];
    
    [ani setToValue:@(2 * M_PI)];
    [ani setRepeatCount:HUGE_VALF];
    [ani setDuration:0.5];
    
    [self.myView.layer addAnimation:ani forKey:@"ani"];
}

@end
