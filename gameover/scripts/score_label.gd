extends Label

var original_position = Vector2.ZERO
var timer = 0
@export var animation_offset = -64
@export var animation_delay = 0

func _ready() -> void:
	original_position = position
	position.x += animation_offset
	text = ""
	
	if GameState.score > GameState.high_score:
		text = "NEW "
		GameState.high_score = GameState.score
		GameState.furthest_room = GameState.room
		
	text += "Score: " + str(GameState.score).pad_zeros(6)
	
	

func _process(_delta:float) -> void:
	if timer > animation_delay:
		position = position.lerp(original_position, 0.1)
	
	if original_position != position:
		timer += 1
