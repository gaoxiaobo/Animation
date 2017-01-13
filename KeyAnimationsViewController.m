//
//  KeyAnimationsViewController.m
//  动画
//
//  Created by TianWan on 2017/1/12.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "KeyAnimationsViewController.h"

@interface KeyAnimationsViewController () <CAAnimationDelegate>


@property (weak, nonatomic) IBOutlet UIView *MyView;

@end

@implementation KeyAnimationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Animation" style:UIBarButtonItemStylePlain target:self action:@selector(animation)];
    
}

- (void)animation
{
    [self moveWithDuration:5 to:self.view.center controllerPointCount:20];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
//    [ani setDuration:0.25];
//    
//    CGFloat angle = M_PI_4/10.0;
//    [ani setValues:@[@(angle),@(-angle),@(angle)]];
//    [ani setRepeatCount:HUGE_VALF];
//    
//    [self.MyView.layer addAnimation:ani forKey:nil];
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSValue *v1 = [NSValue valueWithCGPoint:self.MyView.center];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    NSValue *v3 = [NSValue valueWithCGPoint:point];
    
    NSArray *array = @[v1,v2,v3];
    
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    
    [ani setDelegate:self];
    [ani setValue:@"position" forKey:@"type"];
    [ani setValue:v3 forKey:@"point"];
    
    [ani setValues:array];
    [ani setDuration:2.0];
    
    [self.MyView.layer addAnimation:ani forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSString *type = [anim valueForKey:@"type"];
    if ([type isEqualToString:@"position"]) {
        CGPoint point = [[anim valueForKey:@"point"] CGPointValue];
        self.MyView.center = point;
    }
}

- (void)moveWithDuration:(CFTimeInterval)duration to:(CGPoint)to controllerPointCount:(NSInteger)count
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [ani setDuration:duration];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count + 2];
    [array addObject:[NSValue valueWithCGPoint:self.view.center]];
    for (NSInteger i = 0; i < count; i++) {
        [array addObject:[NSValue valueWithCGPoint:[self randomPoint]]];
    }
    [array addObject:[NSValue valueWithCGPoint:to]];
    [ani setValues:array];
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    [self.MyView.layer addAnimation:ani forKey:nil];
}

- (CGPoint)randomPoint
{
    
    CGFloat x = arc4random_uniform(self.view.bounds.size.width);
    CGFloat y = arc4random_uniform(self.view.bounds.size.height);
    CGPoint point = CGPointMake(x, y);
    return point;
}

@end
