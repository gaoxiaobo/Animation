//
//  BaseDrawView.m
//  动画
//
//  Created by TianWan on 2017/1/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "BaseDrawView.h"

@implementation BaseDrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    [self drawLine];
}

#pragma mark -- 绘制直线
- (void)drawLine
{
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 创建可变路径并设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 划线 设置起始点 设置目标点
    CGPathMoveToPoint(path, NULL, 50, 100);
    CGPathAddLineToPoint(path, NULL, 100, 200);
    
    // 第二条线
    CGPathAddLineToPoint(path, NULL, 50, 200);
    // 关闭路径
    CGPathCloseSubpath(path);
    
    // 将路径添加到上下文
    CGContextAddPath(context, path);
    // 设置上下文属性
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
    // 设置线条宽度
    CGContextSetLineWidth(context, 1);
    // 设置线条的顶点样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 设置线条的连接点样式
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    
    // 虚线的参数
    CGFloat lengths[3] = {5.0,5.0};
    CGContextSetLineDash(context, 0.0, lengths, 2);

    
    // 绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
    // 释放路径
    CGPathRelease(path);
}
@end
