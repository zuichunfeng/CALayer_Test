//
//  ViewController.m
//  CALayer_Test
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 liujian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    在 UIView 中，CALayer 才是负责绘制展示内容的对象

//    一个 UIView 在，至少包含一个CALayer对象，UIView 可以看做是CALayer的管理者，可以在 View 上添加、删除，Layer。
//    CALayer（NSObject）负责展示内容，UIView(UIResponder) 负责处理用户交互
//  基本使用
//  平时 UIView 属性的设置最终都会反映在CALayer上，CALayer还包含 UIView 没有的属性
    
    
//    创建图层对象
        CALayer *layer = [CALayer layer];
//    设置背景
    layer.backgroundColor = [UIColor greenColor].CGColor;
    layer.frame = CGRectMake(100, 100, 200, 200);
    layer.borderWidth = 2.f;
    layer.borderColor = [UIColor redColor].CGColor;
    layer.cornerRadius = 100;
    layer.contents = (id)[UIImage imageNamed:@"hello.jpg"].CGImage;
    layer.masksToBounds = YES;
    [self.view.layer addSublayer:layer];
    
//    self.view.layer insertSublayer:<#(nonnull CALayer *)#> above:<#(nullable CALayer *)#>;
//    self.view.layer insertSublayer:<#(nonnull CALayer *)#> atIndex:<#(unsigned int)#>;
//    self.view.layer insertSublayer:<#(nonnull CALayer *)#> below:<#(nullable CALayer *)#>;
    
//    获得所有的子 layer
    NSLog(@"%@",self.view.layer.sublayers);
//    子 layer 从父 layer 移除
//    [layer removeFromSuperlayer];
    
    CATextLayer *ttextLayer = [CATextLayer layer];
    ttextLayer.frame = CGRectMake(100, 400, 100, 30);
    ttextLayer.string = @"666666";
    
    ttextLayer.foregroundColor = [UIColor blueColor].CGColor;
    ttextLayer.fontSize = 20.f;
    ttextLayer.backgroundColor= [UIColor cyanColor].CGColor;
    ttextLayer.cornerRadius = 10;
    [self.view.layer addSublayer:ttextLayer];
    
//    显示一段渐变的颜色
    CAGradientLayer *graLayer = [CAGradientLayer layer];
    graLayer.frame = CGRectMake(100, 500, 200, 50);
//    渐变包含的颜色
    graLayer.colors = @[(id)[UIColor redColor].CGColor,
                        (id)[UIColor orangeColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor greenColor].CGColor,
                        (id)[UIColor cyanColor].CGColor,
                        (id)[UIColor blueColor].CGColor,
                        (id)[UIColor purpleColor].CGColor];
//    颜色变化的起点和终点
    graLayer.startPoint = CGPointMake(0, 0);
    graLayer.endPoint = CGPointMake(1, 1);
    graLayer.anchorPoint = CGPointMake(1, 1);
    graLayer.position = CGPointMake(100, 100);
    [self.view.layer addSublayer:graLayer];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
