extends StaticBody2D

var play_audio = false

func _process(delta:float) -> void:
	if GameState.puzzles_collected == GameState.puzzle_requirement:
		position = position.lerp(Vector2(position.x, -128), 0.1)
		
		if !play_audio:
			var big_ari = preload("res://locations/bank/big_ari_complete.tscn").instantiate()
			add_sibling(big_ari)
			
			$DoorAudio.play()
			GameState.score += 100
			play_audio = true
	else:
		play_audio = false
