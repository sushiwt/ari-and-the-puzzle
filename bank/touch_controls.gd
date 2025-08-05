extends Node2D

func _ready() -> void:
	if OS.has_feature("web_android") || OS.has_feature("web_ios"):
		visible = true
