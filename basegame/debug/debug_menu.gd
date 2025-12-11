extends Control

func _ready() -> void:
	GameState.puzzle_requirement = 4
	GameState.room = 0
	GameState.score = 0

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file($LineEdit.text)
