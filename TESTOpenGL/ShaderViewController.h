//
//  ShaderViewController.h
//  TESTOpenGL
//
//  Created by yolanda yuan on 18/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "EllipseShader.h"

@interface ShaderViewController : GLKViewController

@property (strong, nonatomic, readwrite) EllipseShader* shader;
@property (nonatomic) GLfloat xAxis;
@property (nonatomic) GLfloat yAxis;

@property (nonatomic,strong) GLKBaseEffect *baseEffect;

@end

