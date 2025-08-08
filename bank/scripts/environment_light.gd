extends CanvasModulate

var light_timer = 1

func _ready() -> void:
	color.r = 0.5 - light_timer
	color.g = 0.5 - light_timer
	color.b = 0.5 - light_timer
	

func _process(_delta:float) -> void:
	color.r = ((128.0 + (GameState.player_seen * 4)) / 256.0) - light_timer
	color.g = 0.5 - light_timer
	color.b = 0.5 - light_timer
	
	if light_timer > 0:
		light_timer -= 0.01
	
