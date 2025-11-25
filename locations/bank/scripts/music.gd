extends AudioStreamPlayer

var found_sound = load("res://music/found.mp3")

var music_playing: bool = false

func _process(_delta:float) -> void:
	if $"../Camera".position.y <= 200 && music_playing == false:
		play()
		music_playing = true
	
	#pitch_scale = 1 - (GameState.player_seen * 0.05)
	if GameState.player_contacted:
		volume_db = -1000
	else:
		volume_db = 0
