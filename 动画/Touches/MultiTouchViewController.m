//
//  MultiTouchViewController.m
//  动画
//
//  Created by TianWan on 2017/1/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight  [UIScreen mainScreen].bounds.size.height
#import "MultiTouchViewController.h"

@interface MultiTouchViewController () <UIGestureRecognizerDelegate>
{
    UIView *_menuView;
    CGPoint _beginPoint;
}

@end

@implementation MultiTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MultiTouch";
    [self.view setMultipleTouchEnabled:YES]; // 默认为NO
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    [self addMenuView];
}

- (void)addMenuView
{
    _menuView = [[UIView alloc] init];
    [self.view.window addSubview:_menuView];
    _menuView.frame = CGRectMake(-kUIScreenWidth, 0, kUIScreenWidth, kUIScreenHeight);
    _menuView.backgroundColor = [UIColor redColor];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}

// 给该控制器添加协议 <UIGestureRecognizerDelegate>

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return gestureRecognizer != self.navigationController.interactivePopGestureRecognizer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _beginPoint = [[touches anyObject] locationInView:self.view];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSInteger i = 0;
    for (UITouch *touch in touches) {
        UIColor *color = i == 0 ? [UIColor redColor]:[UIColor yellowColor];
        UILabel *label = [[UILabel alloc] init];
        label.bounds = CGRectMake(0, 0, 2, 2);
        CGPoint point = [touch locationInView:self.view];
        [label setCenter:point];
        [self.view addSubview:label];
        label.backgroundColor = color;
        [UIView animateWithDuration:2.0 animations:^{
            label.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
        i ++;
    }
}


@end
