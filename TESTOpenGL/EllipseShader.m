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
        _xAxis = glGetUniformLocation(_program, "xAxis");
        _yAxis = glGetUniformLocation(_program, "yAxis");
        _uTime = glGetUniformLocation(_program, "uTime");
        
        [self configureOpenGLES];
    }
    return self;
}

#pragma mark - Public
#pragma mark - Render
- (void)renderInRect:(CGRect)rect{
    
    // Uniforms
    glUniform2f(self.uResolution, CGRectGetWidth(rect)*2.f, CGRectGetHeight(rect)*2.f);
    
    // Draw
//    glDrawArrays(GL_TRIANGLE_STRIP, 0, 6);
      glDrawArrays(GL_TRIANGLE_FAN, 0, 362);
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
    
//    NSMutableArray *verticesV = [[NSMutableArray alloc] init];
//    Vertex *Vertices;
//    int array = 1000;
//    Vertices = (Vertex *)malloc(array * sizeof(Vertex));
    
    
//    for (int i=0;i<1000;++i) {
////        Vertices[i].position = [NSNumber numberWithDouble:cos(2*3.14159*i/1000.0)];
////        Vertices[i+1].position = [NSNumber numberWithDouble:sin(2*3.14159*i/1000.0)];
//        Vertices[i].position = (CGFloat)cos(2*3.14159*i/1000.0);
//        Vertices[i+1].position = (CGFloat)sin(2*3.14159*i/1000.0);
//        
//        const GLfloat Ha[] = {
//            Vertices[i].position, Vertices[i+1].position
//        };
//
//        glEnableVertexAttribArray(_aPosition);
//        glVertexAttribPointer(_aPosition, 2, GL_FLOAT, GL_FALSE, 0, Ha);
//        glDrawArrays(GL_POINTS, 0, 2);
//    };
    
    //draw circle
    GLint numberOfSides = 360;
    GLint numberOfVertices = numberOfSides+2;
    GLfloat circleVerticesX[numberOfVertices];
    GLfloat circleVerticesY[numberOfVertices];
//    GLfloat circleVerticesZ[numberOfVertices];
    
    GLfloat x = 20.f;
    GLfloat y = 20.f;
    
    circleVerticesX[0] = x;
    circleVerticesY[0] = y;
//    circleVerticesZ[0] = 0;
    
    GLfloat doublePi = 2.0f * M_PI;
    
    for(int i=1; i<numberOfVertices; i++){
        circleVerticesX[i] = x + 120.0f * cos(i*doublePi/numberOfSides);
        circleVerticesY[i] = y + 120.0f * sin(i*doublePi/numberOfSides);
//        circleVerticesZ[i] = 0;
    }
    
    GLfloat allCircleVertices[numberOfVertices * 2];
    
    for(int i = 0;i<numberOfVertices;i++){
        allCircleVertices[i*2] = circleVerticesX[i];
        allCircleVertices[i*2+1] = circleVerticesY[i];
//        allCircleVertices[i*2+2] = circleVerticesZ[i];
    }
    
    // Attributes
    glEnableVertexAttribArray(_aPosition);
    glVertexAttribPointer(_aPosition, 2, GL_FLOAT, GL_FALSE, 0, allCircleVertices);
//    glDrawArrays(GL_TRIANGLE_FAN, 0, numberOfVertices);
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


@end
