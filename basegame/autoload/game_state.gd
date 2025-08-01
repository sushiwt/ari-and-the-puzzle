extends Node

var player_contacted = false
var player_detect_amount = 0

var player_seen = 0

func _process(delta: float) -> void:
	
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
