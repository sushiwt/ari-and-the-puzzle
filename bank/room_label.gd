extends Label

func _process(delta:float) -> void:
	text = "Caught in Room " + str(GameState.room)
