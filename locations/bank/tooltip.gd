extends Control

func _process(delta:float) -> void:
	if GameState.room == 1:
		visible = true
	else:
		visible = false
