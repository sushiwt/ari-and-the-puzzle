extends AudioStreamPlayer

var music_playing: bool = false

func _process(_delta:float) -> void:
	if $"../Camera".position.y <= 200 && music_playing == false:
		play()
		music_playing = true
	
	if GameState.player_contacted:
		volume_db = 0
	else:
		volume_db = -1000
