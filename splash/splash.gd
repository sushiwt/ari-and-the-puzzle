extends Node2D

var menu_scene = preload("res://menu.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		get_tree().change_scene_to_packed(menu_scene)
