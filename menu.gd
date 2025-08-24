extends Node2D

var bank = "res://locations/bank/bank.tscn"

func _ready() -> void:
	ResourceLoader.load_threaded_request(bank, "", true)

func load_bank():
	var bank_scene = ResourceLoader.load_threaded_get(bank)
	
	var bank_instance = bank_scene.instantiate()
	
