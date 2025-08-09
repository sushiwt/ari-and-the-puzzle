extends Node2D

var bank = preload("res://locations/bank/bank.tscn")

func _ready() -> void:
	GameState.room -= 1
	
	# TODO find a better deletion state
	GameState.score -= GameState.puzzles_collected * 100
	
	if GameState.puzzles_collected == GameState.puzzle_requirement:
		GameState.score -= 100

func _process(delta:float) -> void:
	if $Player.position.y <= 0:
		get_tree().change_scene_to_packed(bank)
	
