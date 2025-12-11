extends AnimatedSprite2D

func _ready() -> void:
	if GameState.finished_room_15:
		visible = true
