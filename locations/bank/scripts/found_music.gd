extends AudioStreamPlayer

func _ready() -> void:
	play()
	
func _process(_delta:float) -> void:
	if GameState.player_contacted:
		volume_db = 0
	else:
		volume_db = -1000
