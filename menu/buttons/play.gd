extends Button

var loading = preload("res://basegame/loading/loading.tscn")

func _ready() -> void:
	grab_focus()

func _process(_delta:float) -> void:
	if get_viewport().gui_get_focus_owner() == null && Input.is_action_just_pressed("all_arrow_keys"):
		grab_focus()

func _on_pressed() -> void:
	GameState.puzzle_requirement = 4
	GameState.room = 0
	GameState.score = 0
	
	if OS.has_feature("web"):
		get_tree().change_scene_to_file("res://basegame/loading/loading.tscn")
	else:
		var loading_instance = loading.instantiate()
		get_parent().add_child(loading_instance)
