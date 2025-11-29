extends Camera2D

func _ready() -> void:
	if OS.has_feature("web"):
		position = Vector2(0,120)

func _process(_delta:float) -> void:
	if position.x != 120:
		position = position.lerp(Vector2(0,120), 0.05)
