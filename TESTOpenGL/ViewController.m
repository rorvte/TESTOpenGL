//
//  ViewController.m
//  TESTOpenGL
//
//  Created by yolanda yuan on 18/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "ViewController.h"
#import "EllipseShader.h"
#import "ShaderViewController.h"

@interface ViewController ()

@property (nonatomic) UIView *ellipseView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ShaderViewController *ellipseShaderVC = [[ShaderViewController alloc] init];
//    ellipseShaderVC.xAxis = (GLfloat)200.;
//    ellipseShaderVC.yAxis = (GLfloat)80.;
    [self.view addSubview:ellipseShaderVC.view];
    NSLog(@"GLview.frame: w:%f h%f", ellipseShaderVC.view.frame.size.width, ellipseShaderVC.view.frame.size.height);
    NSLog(@"view.frame: w:%f h%f", self.view.frame.size.width, self.view.frame.size.height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
