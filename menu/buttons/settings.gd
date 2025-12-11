extends Button

var settings_scene = preload("res://menu/panels/settings.tscn") # Load the scene file

func _on_pressed() -> void:
	var settings_instance = settings_scene.instantiate() # Create an instance of the scene
	get_parent().get_parent().add_sibling(settings_instance)
	release_focus()
	GameState.focused_ui_element = self
