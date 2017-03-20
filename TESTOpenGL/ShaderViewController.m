//
//  ShaderViewController.m
//  EllipseWithCoordinate
//
//  Created by yolanda yuan on 13/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "ShaderViewController.h"

//typedef struct {
//    GLKVector3 positionCoordinates;
//    GLKVector2 textureCoordinates;
//}VertexData;
//
//VertexData vertices[] = {
//    {-0.5f, -0.5f, 0.0f},
//    {0.5f, -0.5f, 0.0f},
//    {-0.5f, 0.5f, 0.0f},
//    {-0.5f, 0.5f, 0.0f},
//    {0.5f, -0.5f, 0.0f},
//    {0.5f, 0.5f, 0.0f}
//};

@implementation ShaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up context
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    // Set up baseEffect
    //    self.baseEffect = [[GLKBaseEffect alloc] init];
    //    self.baseEffect.useConstantColor = YES;
    //    self.baseEffect.constantColor = GLKVector4Make(1.0f, 0.0f, 0.0f, 1.0f);
    //    self.baseEffect.transform.modelviewMatrix = GLKMatrix4MakeOrtho(0, 640, 0, 1136, 0, 0);
    
    // Set up view
    GLKView *glkView = (GLKView *)self.view;
    glkView.context = context;
    
    // OpenGL ES settings
    glClearColor(0, 1, 1, 0);
    
    // Initialize shader
    self.shader = [[EllipseShader alloc] initWithVertexShader:@"Base" fragmentShader:@"ellipse"];
    //    self.shader.position = GLKVector2Make(500, 700);
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClear(GL_COLOR_BUFFER_BIT);
    
    //    [self.baseEffect prepareToDraw];
    [self.shader renderInRect:rect withXAxis:self.xAxis withYAxis:self.yAxis];
}

@end
