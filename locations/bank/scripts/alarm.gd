extends CanvasModulate

var timer = 0

func _process(_delta:float) -> void:
	timer += 1
	
	if timer >= 60:
		timer = 0
	
	color = Color.from_rgba8(255, 128, 128)
	if timer >= 30:
		color = Color.from_rgba8(128, 128, 255)
