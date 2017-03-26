//
//  EllipseShader.h
//  EllipseWithCoordinate
//
//  Created by yolanda yuan on 13/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//


@interface EllipseShader : NSObject

@property (strong, nonatomic) GLKBaseEffect *baseEffect;
@property (assign) GLKVector2 position;
@property (assign) GLKVector2 moveVelocity;

- (instancetype)initWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh;
- (void)renderInRect:(CGRect)rect withXAxis:(GLfloat)xAxis withYAxis:(GLfloat)yAxis;

- (void)update:(float)dt;

@end
