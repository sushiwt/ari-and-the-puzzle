extends PanelContainer

func _ready() -> void:
	if GameState.high_score == 0:
		visible = false
	else:
		visible = true
	
	$HighScoreLabel.text += str(GameState.high_score).pad_zeros(6) + " in Room " + str(GameState.furthest_room)
