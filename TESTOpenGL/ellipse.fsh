precision highp float;

uniform vec2 uResolution;
uniform float xAxis;
uniform float yAxis;

void main(void) {
    vec2 center = vec2(uResolution.x/2., uResolution.y/2.);
    //    float ellipseLength = sqrt(pow(gl_FragCoord.x-center.x, 2.) + pow(gl_FragCoord.y-center.y, 2.));
    //    float thickness = ellipseLength/50.;
    
    if (pow(gl_FragCoord.x-center.x, 2.)/pow(xAxis, 2.)+pow(gl_FragCoord.y-center.y, 2.)/pow(yAxis, 2.) > 1.) {
        //white
        gl_FragColor = vec4(vec3(1.,1.,1.), 0.);
        discard;
    }else {
        //black
        gl_FragColor = vec4(vec3(0.,0.,0.), 1.);
    }
}
