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
    [self.view addSubview:ellipseShaderVC.view];
    NSLog(@"view.frame: w:%f h:%f", self.view.frame.size.height, self.view.frame.size.width);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
