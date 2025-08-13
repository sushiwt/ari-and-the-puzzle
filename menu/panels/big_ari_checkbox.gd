extends CheckBox

func _ready() -> void:
	if Settings.disable_big_ari:
		button_pressed = true
	else:
		button_pressed = false

func _process(_delta:float) -> void:
	Settings.disable_big_ari = button_pressed
