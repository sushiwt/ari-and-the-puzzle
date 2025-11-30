extends Control

func _process(_delta:float) -> void:
	if GameState.room == 1:
		visible = true
	else:
		visible = false
