extends Node2D

var bank = preload("res://locations/bank/bank.tscn")

func _process(_delta:float) -> void:
	if $Player.position.y <= 0:
		get_tree().change_scene_to_packed(bank)

func change_dialogue_start(start: String):
	$Greybee/GreybeeArea.dialogue_start = start
