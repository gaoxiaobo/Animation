//
//  TouchBaseViewController.m
//  动画
//
//  Created by TianWan on 2017/1/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "TouchBaseViewController.h"

@interface TouchBaseViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation TouchBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Base touch";
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSEnumerator *enumerator = [touches objectEnumerator];
    UITouch *touch;
    while (touch = [enumerator nextObject]) {
        CGPoint point = [touch locationInView:self.view];
        NSLog(@"point:%@",NSStringFromCGPoint(point));
    }
    
    
    NSLog(@"%@",touches);
    NSLog(@"%@",event);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint prePoint = [touch previousLocationInView:self.view];
    NSLog(@"prePoint:%@",NSStringFromCGPoint(prePoint));
    CGPoint curPoint = [touch locationInView:self.view];
    
    CGFloat deltaX = curPoint.x - prePoint.x;
    CGFloat deltaY = curPoint.y - prePoint.y;
    
    self.myView.center = CGPointMake(self.myView.center.x + deltaX, self.myView.center.y + deltaY);
    
}

@end
