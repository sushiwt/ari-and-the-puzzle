extends Area2D

@export var option = "play"

const DEFAULT_ALPHA = 0.75

func ready() -> void:
	modulate.a = DEFAULT_ALPHA

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("confirm"):
		print("You pressed it!")
		
		if option == "play":
			get_tree().change_scene_to_file("res://bank/game.tscn")
		elif option == "quit":
			get_tree().quit()

func _on_mouse_entered() -> void:
	modulate.a = 1

func _on_mouse_exited() -> void:
	modulate.a = DEFAULT_ALPHA
