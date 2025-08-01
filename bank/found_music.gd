extends AudioStreamPlayer

func _process(delta: float) -> void:
	if GameState.player_contacted:
		volume_db = 0
	else:
		volume_db = -1000
