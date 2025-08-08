extends Node2D

var font = preload("res://basegame/fonts/minitext.ttf")

func _process(_delta:float) -> void:
	queue_redraw()

func _draw() -> void:
	var room_string = "Room " + str(GameState.room)
	var room_position = Vector2(6,22)
	var width = 2
	
	draw_string(font, room_position + Vector2(-width, -width), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)
	draw_string(font, room_position + Vector2(0, -width), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)
	draw_string(font, room_position + Vector2(width, -width), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)
	draw_string(font, room_position + Vector2(width, 0), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)
	draw_string(font, room_position + Vector2(width, width), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)
	draw_string(font, room_position + Vector2(0, width), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)
	draw_string(font, room_position + Vector2(-width, width), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)
	draw_string(font,  room_position + Vector2(-width, 0), room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.BLACK)

	draw_string(font, room_position, room_string, HORIZONTAL_ALIGNMENT_LEFT, -1, 32, Color.WHITE)
	
	var score_string = str(GameState.score).pad_zeros(6)
	var score_position = Vector2(254,22)
	
	draw_string(font, score_position + Vector2(-width, -width), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)
	draw_string(font, score_position + Vector2(0, -width), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)
	draw_string(font, score_position + Vector2(width, -width), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)
	draw_string(font, score_position + Vector2(width, 0), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)
	draw_string(font, score_position + Vector2(width, width), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)
	draw_string(font, score_position + Vector2(0, width), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)
	draw_string(font, score_position + Vector2(-width, width), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)
	draw_string(font,  score_position + Vector2(-width, 0), score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.BLACK)

	draw_string(font, score_position, score_string, HORIZONTAL_ALIGNMENT_RIGHT, -1, 32, Color.WHITE)
	
