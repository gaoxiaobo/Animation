//
//  SnapViewController.m
//  动画
//
//  Created by TianWan on 2017/1/16.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()
{
    UIDynamicAnimator *_animator;
    UISnapBehavior *_snap;
}

@property (weak, nonatomic) IBOutlet UIView *orange;


@end

@implementation SnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Snap";
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    [_animator removeBehavior:_snap];
    
    _snap = [[UISnapBehavior alloc] initWithItem:self.orange snapToPoint:point];
    CGFloat damping = arc4random_uniform(10) / 10.0;
    _snap.damping = damping;
    [_animator addBehavior:_snap];
    
}


@end
