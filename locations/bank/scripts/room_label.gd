extends Label

var original_position = Vector2.ZERO
var timer = 0
@export var animation_offset = -64
@export var animation_delay = 0

func _ready() -> void:
	original_position = position
	position.x += animation_offset

func _process(delta:float) -> void:
	text = "Caught in Room " + str(GameState.room)
	if timer > animation_delay:
		position = position.lerp(original_position, 0.1)
	
	if original_position != position:
		timer += 1
