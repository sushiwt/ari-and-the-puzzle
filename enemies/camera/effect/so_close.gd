extends Node2D

var score = 0
var timer = 100.0

func _ready() -> void:
	$Label.text += "+" + str(score)

func _process(_delta: float) -> void:
	timer -= 1
	$Label.position = $Label.position.lerp(Vector2(-44.0,-56), 0.1)
	$Label.modulate.a = timer / 20
	
	if timer < 0:
		queue_free()
