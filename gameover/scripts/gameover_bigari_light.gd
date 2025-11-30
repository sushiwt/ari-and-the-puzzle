extends PointLight2D

var char_sin = 0.0;

func _process(_delta:float) -> void: 
	char_sin += 0.05
	
	texture_scale = 1.0 + (sin(char_sin) * 0.01)
