extends Node

func _ready() -> void:
	if OS.has_feature("web"):
		get_tree().change_scene_to_file("res://splash/splash.tscn")
