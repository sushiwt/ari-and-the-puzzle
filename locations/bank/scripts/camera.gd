extends Camera2D

func _process(_delta:float) -> void:
	if position.x != 120:
		position = position.lerp(Vector2(0,120), 0.05)
