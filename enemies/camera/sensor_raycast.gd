extends RayCast2D

func _process(delta: float) -> void:
	if is_colliding():
		var collider: Node2D = get_collider()
		
		if collider.is_in_group("Player"):
			GameState.player_detect_amount += 1
