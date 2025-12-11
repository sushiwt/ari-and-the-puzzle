extends Control

var is_in_panel = false

func _ready() -> void:
	grab_focus()

func _process(_delta:float) -> void:
	if Input.is_action_just_pressed("back"):
		exit()
		GameState.focused_ui_element.grab_focus()

func _on_panel_container_mouse_entered() -> void:
	is_in_panel = true
	print("Entered")

func _on_panel_container_mouse_exited() -> void:
	is_in_panel = false 
	print("Exit")

func _on_panel_background_gui_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm") and !is_in_panel:
		exit()

func exit():
	queue_free()


func _on_debug_menu_button_button_down() -> void:
	get_tree().change_scene_to_file("res://basegame/debug/debug_menu.tscn")
