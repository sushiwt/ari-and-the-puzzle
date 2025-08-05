extends Area2D

var puzzle_frame = 0
var puzzle_collected = false
var player_area: Node2D

func _ready() -> void:
	$PuzzleSprite.frame = puzzle_frame

func _process(delta:float) -> void:
	if puzzle_collected:
		position = position.lerp(player_area.global_position, 0.1)
		scale -= Vector2(0.1,0.1)
		
		if scale.x <= 0:
			queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		scale = Vector2(1.0,1.0)
		GameState.puzzles_collected += 1
		GameState.score += 100
		player_area = area
		puzzle_collected = true
		
		$PuzzleAudio.play()
