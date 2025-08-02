extends Control

var is_in_panel = false

func _process(delta:float) -> void:
	if Input.is_action_just_pressed("back"):
		exit()

func _on_panel_container_mouse_entered() -> void:
	is_in_panel = true
	print("Entered")

func _on_panel_container_mouse_exited() -> void:
	is_in_panel = false 
	print("Exit")

func _on_panel_background_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm") and !is_in_panel:
		exit()

func exit():
	queue_free()
