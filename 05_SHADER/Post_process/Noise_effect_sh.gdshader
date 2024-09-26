shader_type canvas_item;

uniform sampler2D noise_texture;  // Noise texture input
uniform float intensity : hint_range(0.0, 1.0) = 0.5;  // Intensity of the noise
uniform float noise_scale : hint_range(1.0, 100.0) = 10.0; // Scale of the noise texture

void fragment() {
    // Get the base color of the ColorRect (or default white if no texture is set)
    vec4 base_color = texture(TEXTURE, UV);
    
    // Sample the noise texture using the screen coordinates, scaled by 'noise_scale'
    vec2 noise_uv = UV * noise_scale;
    vec4 noise_color = texture(noise_texture, noise_uv);
    
    // Mix the base color with the noise texture based on the intensity
    vec4 final_color = mix(base_color, noise_color, intensity);
    
    // Output the final color
    COLOR = final_color;
}