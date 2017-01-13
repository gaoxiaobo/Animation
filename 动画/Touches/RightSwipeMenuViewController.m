//
//  RightSwipeMenuViewController.m
//  动画
//
//  Created by TianWan on 2017/1/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//
#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight  [UIScreen mainScreen].bounds.size.height
#import "RightSwipeMenuViewController.h"
#import "AppDelegate.h"
@interface RightSwipeMenuViewController () <UIGestureRecognizerDelegate>
{
    UIView *_menuView;
    CGPoint _beginPoint;
    BOOL _isShow;
}

@end

@implementation RightSwipeMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isShow = NO;
    self.title = @"MultiTouch";
    [self.view setMultipleTouchEnabled:YES]; // 默认为NO
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeMenu) name:@"closeMenuView" object:nil];
}

- (void)closeMenu
{
    [UIView animateWithDuration:0.25 animations:^{
        _menuView.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        _isShow = NO;
    }];
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
    [self.navigationController.view addSubview:_menuView];
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
    if (_isShow == NO) {
        _beginPoint = [[touches anyObject] locationInView:self.view];
    }else {
        _beginPoint = [[touches anyObject] locationInView:self.view.window];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!_isShow) {
        CGPoint point = [[touches anyObject] locationInView:self.view];
        CGFloat deltaX = point.x - _beginPoint.x;
        
        if (deltaX > 0) {
            _menuView.transform = CGAffineTransformMakeTranslation(deltaX, 0);
        }
    }else {
        CGPoint point = [[touches anyObject] locationInView:self.view.window];
        CGFloat deltaX = point.x - _beginPoint.x;
        
        if (deltaX < 0) {
            _menuView.transform = CGAffineTransformMakeTranslation(kUIScreenWidth + deltaX, 0);
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_isShow == NO) {
        CGPoint point = [[touches anyObject] locationInView:self.view.window];
        if (point.x - _beginPoint.x > 60) {
            [UIView animateWithDuration:0.25 animations:^{
                _menuView.transform = CGAffineTransformMakeTranslation(kUIScreenWidth, 0);
            } completion:^(BOOL finished) {
                _isShow = YES;
            }];
        }else {
            [UIView animateWithDuration:0.25 animations:^{
                _menuView.transform = CGAffineTransformMakeTranslation(0, 0);
            } completion:^(BOOL finished) {
                _isShow = NO;
            }];
        }
    }else {
        CGPoint point = [[touches anyObject] locationInView:self.view];
        if (point.x - _beginPoint.x < -60) {
            [UIView animateWithDuration:0.25 animations:^{
                _menuView.transform = CGAffineTransformMakeTranslation(0, 0);
            } completion:^(BOOL finished) {
                _isShow = NO;
            }];
        }else {
            [UIView animateWithDuration:0.25 animations:^{
                _menuView.transform = CGAffineTransformMakeTranslation(kUIScreenWidth, 0);
            } completion:^(BOOL finished) {
                _isShow = YES;
            }];
        }
 
    }
}

@end
