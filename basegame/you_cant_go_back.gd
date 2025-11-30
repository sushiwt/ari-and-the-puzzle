extends CanvasLayer

func _ready() -> void:
	$YouCantGoBack.modulate.a = 2

func _process(_delta: float) -> void:
	$YouCantGoBack.position = $YouCantGoBack.position.lerp(Vector2(119, 8), 0.1)
	
	$YouCantGoBack.modulate.b -= 0.01
	$YouCantGoBack.modulate.g -= 0.01
	$YouCantGoBack.modulate.a -= 0.01
	
	if $YouCantGoBack.modulate.a <= 0:
		queue_free()
