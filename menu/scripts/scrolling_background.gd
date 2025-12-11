extends Sprite2D

func _process(_delta:float) -> void:
	position.x -= 4
	if position.x <= -128:
		position.x = 320
