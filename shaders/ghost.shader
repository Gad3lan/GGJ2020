shader_type canvas_item;

uniform vec2 Offset = vec2(8,8);
uniform vec4 WrappingColor :hint_color;
uniform float Wrapping;

float rand(vec2 coord){
	return fract(sin(dot(coord, vec2(56, 78)) * 1000.0) * 1000.0);
}

float noise(vec2 coord){
	vec2 i = floor(coord);
	vec2 f = fract(coord);

	// 4 corners of a rectangle surrounding our point
	float a = rand(i);
	float b = rand(i + vec2(1.0, 0.0));
	float c = rand(i + vec2(0.0, 1.0));
	float d = rand(i + vec2(1.0, 1.0));

	vec2 cubic = f * f * (3.0 - 2.0 * f);

	return mix(a, b, cubic.x) + (c - a) * cubic.y * (1.0 - cubic.x) + (d - b) * cubic.x * cubic.y;
}


void fragment(){
    vec2 ps = TEXTURE_PIXEL_SIZE;
	vec2 timeFactRot = vec2(sin(TIME/5.),cos(TIME/5.));
	float inversesWrapping = 1./Wrapping;
	vec2 uv = -0.25+(0.05+-0.1*noise((UV-timeFactRot*2.)*8.)+UV-0.5)*Wrapping*Wrapping+0.5*inversesWrapping;
    vec4 col = texture(TEXTURE, uv);
	col = mix(col,WrappingColor,col.a*(1.-inversesWrapping));
	col.a *= inversesWrapping;
	col.a *= noise((uv+timeFactRot)*8.);
	 
    COLOR = col;
}