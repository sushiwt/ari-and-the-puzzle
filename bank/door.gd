extends StaticBody2D

var play_audio = false

func _process(delta:float) -> void:
	if GameState.puzzles_collected == GameState.puzzle_requirement:
		position = position.lerp(Vector2(position.x, -64), 0.1)
		
		if !play_audio:
			$DoorAudio.play()
			GameState.score += 100
			play_audio = true
	else:
		play_audio = false
