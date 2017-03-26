//
//  EllipseShader.m
//  EllipseWithCoordinate
//
//  Created by yolanda yuan on 13/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "EllipseShader.h"

@interface EllipseShader ()

// Program Handle
@property (assign, nonatomic, readonly) GLuint program;

// Attribute Handles
@property (assign, nonatomic, readonly) GLuint aPosition;

// Uniform Handles
@property (assign, nonatomic, readonly) GLuint uResolution;
@property (assign, nonatomic, readonly) GLuint screenWidth;
@property (assign, nonatomic, readonly) GLuint screenHeight;
@property (assign, nonatomic, readonly) GLuint xAxis;
@property (assign, nonatomic, readonly) GLuint yAxis;
@property (assign, nonatomic, readonly) GLuint uTime;

@end

@implementation EllipseShader

#pragma mark - Lifecycle
- (instancetype)initWithVertexShader:(NSString *)vsh fragmentShader:(NSString *)fsh {
    self = [super init];
    if (self) {
        // Program
        _program = [self programWithVertexShader:vsh fragmentShader:fsh];
        
        // Attributes
        _aPosition = glGetAttribLocation(_program, "aPosition");
        
        // Uniforms
        _uResolution = glGetUniformLocation(_program, "uResolution");
        _screenWidth = glGetUniformLocation(_program, "screenWidth");
        _screenHeight = glGetUniformLocation(_program, "screenHeight");
        _xAxis = glGetUniformLocation(_program, "xAxis");
        _yAxis = glGetUniformLocation(_program, "yAxis");
        _uTime = glGetUniformLocation(_program, "uTime");
        _projectionUniform = glGetUniformLocation(_program, "Projection");
        [self configureOpenGLES];
    }
    return self;
}

#pragma mark - Public
#pragma mark - Render
- (void)renderInRect:(CGRect)rect withXAxis:(GLfloat)xAxis withYAxis:(GLfloat)yAxis withScreenWidth:(GLfloat)screenWidth withScreenHeight:(GLfloat)screenHeight{
    
    // Uniforms
<<<<<<< HEAD
    glUniform2f(self.uResolution, CGRectGetWidth(rect)*2.f, CGRectGetHeight(rect)*2.f);
    glUniform1f(self.screenWidth, screenWidth);
    glUniform1f(self.screenHeight, screenHeight);
=======
    glUniform2f(self.uResolution, 0.5, 0.5);
   glUniform1f(self.screenWidth, screenWidth);
   glUniform1f(self.screenHeight, screenHeight);
>>>>>>> origin/master
    glUniform1f(self.xAxis, 200);
    glUniform1f(self.yAxis, 80);
    
//    self.baseEffect = [[GLKBaseEffect alloc] init];
//    GLKMatrix4 scaleMatrix2 = GLKMatrix4MakeScale(0.5, 0.5, 1);
//    GLKMatrix4 transMatrix2 = GLKMatrix4MakeTranslation(0.28, 0.25, 0);
//    self.baseEffect.transform.modelviewMatrix = GLKMatrix4Multiply(transMatrix2, scaleMatrix2);
//    self.baseEffect.transform.modelviewMatrix = self.modelMatrix;
//    [self.baseEffect prepareToDraw];
    
    // Draw
<<<<<<< HEAD
//    glDrawArrays(GL_TRIANGLE_STRIP, 0, 6);
     glDrawArrays(GL_TRIANGLES, 0, 3);

=======
>>>>>>> origin/master
//    float translation[16] = { 1,  0,  0,  0,
//        0,  1,  0,  0,
//        0,  0,  1,  0,
//        0.25, 0.5, 0, 1 };
//    glUniformMatrix4fv(self.projectionUniform, 1, 0, &translation[0]);
<<<<<<< HEAD
//    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
=======
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
>>>>>>> origin/master
}

#pragma mark - Private
#pragma mark - Configurations
- (void)configureOpenGLES {
    // Program
    glUseProgram(_program);
    
//    static const GLfloat vertices[] = {
//        -1.0f, -1.0f,
//        1.0f, -1.0f,
//        -1.0f,  1.0f,
//        1.0f,  1.0f,
//    };
    
    static const GLfloat vertices[] = {
        0.0f, 0.0f,
        1.0f, 0.0f,
        0.0f,  1.0f,
    };
    
    // Attributes
    glEnableVertexAttribArray(_aPosition);
    glVertexAttribPointer(_aPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
}

#pragma mark - Compile & Link
- (GLuint)programWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh {
    // Build shaders
    GLuint vertexShader = [self shaderWithName:vsh type:GL_VERTEX_SHADER];
    GLuint fragmentShader = [self shaderWithName:fsh type:GL_FRAGMENT_SHADER];
    
    // Create program
    GLuint programHandle = glCreateProgram();
    
    // Attach shaders
    glAttachShader(programHandle, vertexShader);
    glAttachShader(programHandle, fragmentShader);
    
    // Link program
    glLinkProgram(programHandle);
    
    // Check for errors
    GLint linkSuccess;
    glGetProgramiv(programHandle, GL_LINK_STATUS, &linkSuccess);
    if (linkSuccess == GL_FALSE) {
        GLchar messages[1024];
        glGetProgramInfoLog(programHandle, sizeof(messages), 0, &messages[0]);
        NSLog(@"%@:- GLSL Program Error: %s", [self class], messages);
    }
    
    // Delete shaders
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);
    
    return programHandle;
}

- (GLuint)shaderWithName:(NSString*)name type:(GLenum)type {
    // Load the shader file
    NSString* file;
    if (type == GL_VERTEX_SHADER) {
        file = [[NSBundle mainBundle] pathForResource:name ofType:@"vsh"];
    } else if (type == GL_FRAGMENT_SHADER) {
        file = [[NSBundle mainBundle] pathForResource:name ofType:@"fsh"];
    }
    
    // Create the shader source
    const GLchar* source = (GLchar*)[[NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil] UTF8String];
    
    // Create the shader object
    GLuint shaderHandle = glCreateShader(type);
    
    // Load the shader source
    glShaderSource(shaderHandle, 1, &source, 0);
    
    // Compile the shader
    glCompileShader(shaderHandle);
    
    // Check for errors
    GLint compileSuccess;
    glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &compileSuccess);
    if (compileSuccess == GL_FALSE) {
        GLchar messages[1024];
        glGetShaderInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
        NSLog(@"%@:- GLSL Shader Error: %s", [self class], messages);
    }
    
    return shaderHandle;
}

- (GLKMatrix4) modelMatrix {
    GLKMatrix4 modelMatrix = GLKMatrix4Identity;
    modelMatrix = GLKMatrix4Translate(modelMatrix, self.position.x, self.position.y, 0);
    return modelMatrix;
}

//- (void)update:(float)dt {
//    GLKVector2 curMove = GLKVector2MultiplyScalar(self.moveVelocity, dt);
//    self.position = GLKVector2Add(self.position, curMove);
//}

@end
