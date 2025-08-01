extends AudioStreamPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#pitch_scale = 1 - (GameState.player_seen * 0.05)
	if GameState.player_contacted:
		volume_db = -1000
	else:
		volume_db = 0
