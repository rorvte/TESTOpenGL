precision highp float;

uniform vec2 uResolution;
uniform float screenWidth;
uniform float screenHeight;
uniform float xAxis;
uniform float yAxis;

void main(void) {
//    vec2 center = vec2(uResolution.x/2., uResolution.y/2.);
<<<<<<< HEAD
<<<<<<< HEAD
    
     gl_FragColor = vec4(vec3(0.,0.,0.), 1.);
    
//    if (pow(gl_FragCoord.x-center.x, 2.)/pow(xAxis, 2.)+pow(gl_FragCoord.y-center.y, 2.)/pow(yAxis, 2.) > 1. || pow(gl_FragCoord.x-center.x, 2.)/pow(xAxis, 2.)+pow(gl_FragCoord.y-center.y, 2.)/pow(yAxis, 2.) < 48./50.) {
//        //white
//        gl_FragColor = vec4(vec3(1.,1.,1.), 0.);
//        discard;
//    }else {
//        //black
//        gl_FragColor = vec4(vec3(0.,0.,0.), 1.);
//    }
=======
    vec2 center = vec2(screenWidth, screenHeight);
    float x = gl_FragCoord.x;
    float y = gl_FragCoord.y;
    
=======
    vec2 center = vec2(screenWidth, screenHeight);
    float x = gl_FragCoord.x;
    float y = gl_FragCoord.y;
    
>>>>>>> origin/master
    if (pow(x-center.x, 2.)/pow(xAxis, 2.)+pow(y-center.y, 2.)/pow(yAxis, 2.) > 1. || pow(x-center.x, 2.)/pow(xAxis, 2.)+pow(y-center.y, 2.)/pow(yAxis, 2.) < 48./50.) {
        //white
        gl_FragColor = vec4(vec3(1.,1.,1.), 0.);
        discard;
    }else {
        //black
        gl_FragColor = vec4(vec3(0.,0.,0.), 1.);
    }
>>>>>>> origin/master
}
