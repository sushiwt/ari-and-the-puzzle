extends Sprite2D

@export var position_change = 0.05

func _process(_delta:float) -> void:
	position.x -= position_change
