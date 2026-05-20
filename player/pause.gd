extends Control

var viewport_image: Image
var texture = ImageTexture.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_image = get_viewport().get_texture().get_image()
	
	var texturerect = TextureRect.new()
	texturerect.texture = ImageTexture.create_from_image(viewport_image)
	texturerect.global_position = Vector2(0, -90)
	$CanvasLayer.add_child(texturerect)
	
	$CanvasLayer/PlayButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		queue_free()
