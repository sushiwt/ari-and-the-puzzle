extends Label

func _ready() -> void:
	visible = false
	if GameState.finished_room_15 == true:
		$TODO.visible = true
	else:
		$TODO.visible = false
	
	GameState.finished_room_15 = true
	await get_tree().create_timer(2).timeout
	visible = true
