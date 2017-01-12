//
//  KeyAnimationViewController.m
//  动画
//
//  Created by gaobo on 2017/1/6.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "KeyAnimationViewController.h"

@interface KeyAnimationViewController ()

@property (weak, nonatomic) IBOutlet UIView *MyView;


@end

@implementation KeyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    [ani setDuration:0.25];
    
    CGFloat angle = M_PI_4/10.0;
    [ani setValues:@[@(angle),@(-angle),@(angle)]];
    [ani setRepeatCount:HUGE_VALF];
    
    [self.MyView.layer addAnimation:ani forKey:nil];
}


@end
