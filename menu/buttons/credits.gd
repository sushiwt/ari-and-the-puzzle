extends Button

var credits_scene = preload("res://menu/panels/credits.tscn") 

func _on_pressed() -> void:
	var credits_instance = credits_scene.instantiate() 
	get_parent().get_parent().add_sibling(credits_instance)
	release_focus()
	GameState.focused_ui_element = self
