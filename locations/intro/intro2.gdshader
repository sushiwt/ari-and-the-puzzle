shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform float wave_frequency: hint_range(0.0, 30.0) = 20.0;
uniform float wave_amplitude: hint_range(0.0, 1.0) = 0.1;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	
    COLOR = textureLod(screen_texture, 
	SCREEN_UV + vec2(floor((sin(TIME + UV.y*wave_frequency) * wave_amplitude)*320.0)/320.0, 0), 
	0.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
