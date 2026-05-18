extends HSlider

@export var bus = "Master"
var volume

func _ready() -> void:
	volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	value = pow(10.0, volume/20)
	grab_focus()
	
func _process(_delta:float) -> void:
	if value > 0.0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), 20 * (log(value) / log(10)))
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), -80)
	
	
