extends Node

var player_contacted = false

var player_detect_amount = 0

func _process(delta: float) -> void:
	
	if player_detect_amount > 0:
		player_contacted = true
	else:
		player_contacted = false
	
	print(str(player_detect_amount) + ", " + str(player_contacted))
	
