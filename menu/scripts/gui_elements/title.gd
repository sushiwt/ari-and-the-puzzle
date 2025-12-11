extends Node2D

var original_position = Vector2.ZERO
var timer = 0
@export var animation_offset = -64
@export var animation_delay = 0
@export var weight = 0.1

func _ready() -> void:
	original_position = position
	position.x += animation_offset

func _process(_delta:float) -> void:
	if timer > animation_delay:
		position = position.lerp(original_position, weight)
	
	if original_position != position:
		timer += 1
	
	
