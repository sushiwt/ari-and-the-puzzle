extends Node2D

func _process(_delta:float) -> void:
	if GameState.room == 8:
		visible = true
	else:
		visible = false
