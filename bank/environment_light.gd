extends CanvasModulate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	color.r = (128.0 + (GameState.player_seen * 2)) / 256.0
