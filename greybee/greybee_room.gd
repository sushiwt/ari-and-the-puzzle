extends Node2D

var bank = preload("res://bank/bank.tscn")

func _process(_delta:float) -> void:
	if $Player.position.y <= 0:
		get_tree().change_scene_to_packed(bank)
