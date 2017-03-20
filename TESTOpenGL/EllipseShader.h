//
//  EllipseShader.h
//  EllipseWithCoordinate
//
//  Created by yolanda yuan on 13/3/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//


@interface EllipseShader : NSObject

//- (id)initWithEffect:(GLKBaseEffect *)baseEffect;

//@property (nonatomic) GLuint projectionUniform;
@property (assign) GLKVector2 position;
//@property (nonatomic, strong) GLKTextureInfo *textureInfo;

- (instancetype)initWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh;
- (void)renderInRect:(CGRect)rect withXAxis:(GLfloat)xAxis withYAxis:(GLfloat)yAxis;

@end
