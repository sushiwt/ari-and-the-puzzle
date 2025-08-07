extends Node2D

func _process(_delta:float) -> void:
	if $Player.position.y <= 0:
		get_tree().change_scene_to_file("res://bank/game.tscn")
