extends Area2D

@export var location_path: String
@export var next_position: Vector2

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		await get_tree().physics_frame
		get_tree().change_scene_to_file("res://locations/" + location_path)
		
		GameState.player_switch_confirm = true
		GameState.player_switch_position = next_position
		
