//
//  EllipseShader.h
//  EllipseWithCoordinate
//
//  Created by yolanda yuan on 13/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//


@interface EllipseShader : NSObject

<<<<<<< HEAD
@property (nonatomic) GLuint projectionUniform;
@property (assign) GLKVector2 position;
- (instancetype)initWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh;
- (void)renderInRect:(CGRect)rect withXAxis:(GLfloat)xAxis withYAxis:(GLfloat)yAxis withScreenWidth:(GLfloat)screenWidth withScreenHeight:(GLfloat)screenHeight;

- (void)update:(float)dt;
=======
- (void)update:(float)dt;

//@property (strong, nonatomic) GLKBaseEffect *baseEffect;

@property (nonatomic) GLuint projectionUniform;
@property (assign) GLKVector2 position;

@property (assign) GLKVector2 moveVelocity;

- (instancetype)initWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh;
- (void)renderInRect:(CGRect)rect withXAxis:(GLfloat)xAxis withYAxis:(GLfloat)yAxis withScreenWidth:(GLfloat)screenWidth withScreenHeight:(GLfloat)screenHeight;
>>>>>>> origin/master

@end
