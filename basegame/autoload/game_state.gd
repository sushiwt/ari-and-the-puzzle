extends Node

var room = 0
var score = 0

var furthest_room = 0
var high_score = 0

var puzzles_collected = 0
var puzzle_requirement = 4

var paused = false

var room_timer = 0
var game_over = false

var player_contacted = false
var player_detect_amount = 0

var player_seen = 0

var the_boolean_that_checks_if_youve_entered_the_greybuzgian_room = false

var finished_room_15 = false

var focused_ui_element: Button

func _process(_delta:float) -> void:
	room_timer += 1
	
	if player_detect_amount > 0:
		player_contacted = true
	else:
		player_contacted = false
		
	if player_contacted:
		player_seen += 1
	else:
		if player_seen > 0:
			player_seen -= 1
		else:
			player_seen = 0
	
	if player_seen == 25:
		game_over = true
		

func reset_game_state():
	puzzles_collected = 0
	room_timer = 0
	player_detect_amount = 0
	player_seen = 0
	game_over = false
	
