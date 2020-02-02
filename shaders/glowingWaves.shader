shader_type canvas_item;

uniform vec2 offset = vec2(0.51,0.46);
uniform vec4 circleColor:hint_color;


float squaredLength(vec2 vec){
	return vec.x * vec.x + vec.y * vec.y;
}
float smoothEquality(float a, float b, float sharpness){
    return exp(-(a-b)*(a-b)*sharpness);
}


float smoothedCircle(vec2 xy, vec2 center,
                    float radius, float sharpness){
    xy/=radius;
    return smoothEquality(length(xy-center),radius,sharpness);
}




void fragment(){

    vec4 col = texture(TEXTURE, UV);
	vec2 xy = UV-offset;
	float circle = 1.-smoothedCircle(xy,vec2(0,0),0.3 *(1.+ 0.5*sin(TIME*3.)),500.);
	col = mix(circleColor,col,circle);
    COLOR = col;
}