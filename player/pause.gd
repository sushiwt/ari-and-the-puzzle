extends Control

var viewport_image: Image
var texture = ImageTexture.new()

var timer = 0
var button_toggle = false

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
		button_toggle = true;
		
	if button_toggle:
		timer += 1
		
		$CanvasLayer/Label3.visible = true
		
		if timer > 5:
			queue_free()

func _on_play_button_button_down() -> void:
	button_toggle = true
