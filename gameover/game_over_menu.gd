extends Node2D

func _ready() -> void:
	# Sets the high score and the room you were in
	if GameState.score > GameState.high_score:
		GameState.furthest_room = GameState.room
		GameState.high_score = GameState.score
