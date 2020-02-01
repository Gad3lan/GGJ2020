shader_type canvas_item;

uniform vec2 offset = vec2(8,8);
uniform vec4 modulate:hint_color;
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
	
    vec4 shadow = vec4(modulate.rgb, texture(TEXTURE, UV - offset*ps).a*modulate.a);
    vec4 col = texture(TEXTURE, UV);
	col.a *= noise((UV+vec2(sin(TIME) * fract(TIME/10.),cos(TIME/10.) * fract(TIME)))*8.);
    COLOR = col;
}