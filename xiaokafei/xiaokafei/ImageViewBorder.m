//
//  ImageViewBorder.m
//  xiaokafei
//
//  Created by Xin Qin on 3/16/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ImageViewBorder.h"

@implementation ImageViewBorder


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    debugMethod();
    //创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //指定矩形
    CGRect rectangle = CGRectMake(0, 0, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
    
    //将矩形添加到路径中
    CGPathAddRect(path, NULL, rectangle);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //将路径添加到上下文
    CGContextAddPath(context, path);
    
    //设置举行填充色
    [[UIColor whiteColor] setFill];
    
    //矩形边框颜色
    [[UIColor blackColor] setStroke];
    
    //边框宽度
    CGContextSetLineWidth(context, 10.f);
    
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
    CGPathRelease(path);

}


@end
