shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform vec4 Dark_color : source_color;
uniform vec4 Light_color : source_color;
uniform vec4 Specular_color : source_color = vec4(0.780000, 0.672360, 0.421200, 1.000000);
uniform float Specular = 0.20000000298023;



void fragment() {
// ColorParameter:2
	vec4 n_out2p0 = Dark_color;


// Output:0
	ALBEDO = vec3(n_out2p0.xyz);


}

void light() {
// Input:34
	vec3 n_out34p0 = ALBEDO;


// ColorParameter:26
	vec4 n_out26p0 = Light_color;


// FloatConstant:3
	float n_out3p0 = 1.000000;


// FloatConstant:2
	float n_out2p0 = 0.400000;


	float n_out4p0;
// Expression:4
	n_out4p0 = 0.0;
	{
		const float DITHER_THRESHOLDS[16] ={
				1.0 / 17.0, 9.0 / 17.0, 3.0 / 17.0, 11.0 / 17.0,
				13.0 / 17.0, 5.0 / 17.0, 15.0 / 17.0, 7.0 / 17.0,
				4.0 / 17.0, 12.0 / 17.0, 2.0 / 17.0, 10.0 / 17.0,
				16.0 / 17.0, 8.0 / 17.0, 14.0 / 17.0, 6.0 / 17.0
			};
			
		vec2 uv = FRAGCOORD.xy * n_out2p0;
		int index = (int(uv.x) % 4) * 4 + int(uv.y) % 4;
		n_out4p0 = n_out3p0 - DITHER_THRESHOLDS[index];
	}


// Input:12
	vec3 n_out12p0 = NORMAL;


// Input:19
	vec3 n_out19p0 = LIGHT;


// DotProduct:13
	float n_out13p0 = dot(n_out12p0, n_out19p0);


// Clamp:17
	float n_in17p1 = 0.00000;
	float n_in17p2 = 1.00000;
	float n_out17p0 = clamp(n_out13p0, n_in17p1, n_in17p2);


// Input:20
	float n_out20p0 = ATTENUATION;


// VectorOp:21
	vec2 n_out21p0 = vec2(n_out17p0) * vec2(n_out20p0);


// Step:11
	float n_out11p0 = step(n_out4p0, n_out21p0.x);


// Mix:25
	vec3 n_out25p0 = mix(n_out34p0, vec3(n_out26p0.xyz), vec3(n_out11p0));


// ColorParameter:31
	vec4 n_out31p0 = Specular_color;


// Input:27
	float n_out27p0 = ATTENUATION;


// FloatParameter:30
	float n_out30p0 = Specular;


// FloatOp:29
	float n_out29p0 = n_out27p0 * n_out30p0;


// VectorOp:28
	vec2 n_out28p0 = vec2(n_out17p0) * vec2(n_out29p0);


// Step:33
	float n_out33p0 = step(n_out4p0, n_out28p0.x);


// Mix:32
	vec3 n_out32p0 = mix(n_out25p0, vec3(n_out31p0.xyz), vec3(n_out33p0));


// Output:0
	SPECULAR_LIGHT += n_out32p0;


}
