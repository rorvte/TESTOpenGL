precision highp float;

uniform vec2 uResolution;
uniform float xAxis;
uniform float yAxis;

void main(void) {
    vec2 center = vec2(uResolution.x, uResolution.y);
    
    float radians = -40.0 * 3.14159 / 180.0;
    float s = sin(radians);
    float c = cos(radians);
    
    float transX = c*(gl_FragCoord.x-center.x) - s*(gl_FragCoord.y-center.y);
    float transY = s*(gl_FragCoord.x-center.x) + c*(gl_FragCoord.y-center.y);
    
    if (pow(transX, 2.)/pow(xAxis, 2.)+pow(transY, 2.)/pow(yAxis, 2.) > 1. || pow(transX, 2.)/pow(xAxis, 2.)+pow(transY, 2.)/pow(yAxis, 2.) < 48./50.) {
        //white
        gl_FragColor = vec4(vec3(1.,1.,1.), 0.);
        discard;
    }else {
        //black
        gl_FragColor = vec4(vec3(0.,0.,0.), 1.);
    }

}
