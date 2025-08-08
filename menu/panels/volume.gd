extends HSlider

@export var bus = "Master"
var volume

func _ready() -> void:
	volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index(bus))
	value = volume
	
func _process(_delta:float) -> void:
	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), value)
