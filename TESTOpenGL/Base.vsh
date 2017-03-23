attribute vec2 aPosition;

//mat4: 4X4矩阵
uniform mat4 Projection;

void main(void) {
    gl_Position = vec4(aPosition, 0., 1.);
//    gl_Position = Projection * vec4(aPosition, 0., 1.);
}
