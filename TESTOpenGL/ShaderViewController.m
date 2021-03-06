//
//  ShaderViewController.m
//  EllipseWithCoordinate
//
//  Created by yolanda yuan on 13/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "ShaderViewController.h"

@implementation ShaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up context
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    // Set up view
    GLKView *glkView = (GLKView *)self.view;
    glkView.context = context;
    
    // OpenGL ES settings
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    
    // Initialize shader
    self.shader = [[EllipseShader alloc] initWithVertexShader:@"Base" fragmentShader:@"ellipse"];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self.shader renderInRect:(CGRect)rect withXAxis:self.xAxis withYAxis:self.yAxis];

}



@end
