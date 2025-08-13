extends CheckBox

func _ready() -> void:
	if Settings.slide_on_walls:
		button_pressed = true
	else:
		button_pressed = false

func _process(_delta:float) -> void:
	Settings.slide_on_walls = button_pressed
