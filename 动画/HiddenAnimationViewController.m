//
//  HiddenAnimationViewController.m
//  动画
//
//  Created by gaobo on 2016/12/27.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "HiddenAnimationViewController.h"

@interface HiddenAnimationViewController () <CALayerDelegate>
{
    CALayer *_layer;
    NSArray *_imageArray;
}

@property (weak, nonatomic) IBOutlet UIView *square;


@end

@implementation HiddenAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layer = [[CALayer alloc] init];
    
    
    [self.view.layer addSublayer:_layer];
    _layer.backgroundColor = [UIColor orangeColor].CGColor;
    _layer.frame = CGRectMake(0, 64, 200, 200);
    
    _layer.anchorPoint = CGPointMake(0, 0);
    _layer.position = CGPointMake(200, 200);
//    [_layer setDelegate:self]; // 设置代理
//    [_layer setNeedsDisplay];
//    _layer.anchorPoint = CGPointMake(0, 0);
    
    _imageArray = @[@"bose",@"cat"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES]; // 取消动画
    
    _layer.position = point;
    
    // bounds
    CGFloat width = arc4random()%100;
    _layer.bounds = CGRectMake(0, 0, width, width);
    
    // 角度
    CGFloat angle = arc4random()%180 / 180.0 * M_PI;
    _layer.transform = CATransform3DMakeRotation(angle, 0, 0, 1);
    _layer.cornerRadius = 5;
    // 颜色
    CGFloat red = arc4random()%255;
    CGFloat green = arc4random()%255;
    CGFloat blue = arc4random()%255;
    _layer.backgroundColor = [UIColor colorWithRed:red/255.0f green:green/255.0f  blue:blue/255.0f  alpha:1].CGColor;
    
    // 内容
    NSInteger index = arc4random() % _imageArray.count;
    UIImage *image = [UIImage imageNamed:_imageArray[index]];
    [_layer setContents:(id)image.CGImage];
    
    
    [CATransaction commit];
}

#pragma mark -- CALayer代理方法
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"drawLayer:inContext:");
    
    // 重新画图
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1);
    CGContextAddRect(ctx, rect);
    CGContextDrawPath(ctx, kCGPathFill);
}

- (void)layerWillDraw:(CALayer *)layer
{
    NSLog(@"layerWillDraw:");
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    NSLog(@"layoutSublayersOfLayer:");
}


@end
