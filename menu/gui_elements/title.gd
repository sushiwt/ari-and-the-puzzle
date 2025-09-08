class_name Title extends Node2D

var original_position = Vector2.ZERO
var timer = 0
@export var animation_offset = -64
@export var animation_delay = 0

func _ready() -> void:
	original_position = position
	position.x += animation_offset

func _process(delta:float) -> void:
	if timer > animation_delay:
		position = position.lerp(original_position, 0.1)
	
	if original_position != position:
		timer += 1
