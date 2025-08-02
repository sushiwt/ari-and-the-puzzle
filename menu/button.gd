extends Area2D

@export var option = "play"

const DEFAULT_ALPHA = 0.75
var original_position = Vector2.ZERO

var timer = 0
@export var animation_offset = -64
@export var animation_delay = 0

func _ready() -> void:
	modulate.a = DEFAULT_ALPHA
	original_position = position
	position.x += animation_offset

func _process(delta:float) -> void:
	if timer > animation_delay:
		position = position.lerp(original_position, 0.1)
	
	if original_position != position:
		timer += 1

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("confirm"):
		print("You pressed it!")
		
		if option == "play":
			get_tree().change_scene_to_file("res://bank/game.tscn")
		if option == "settings":
			var settings_scene = preload("res://menu/settings.tscn") # Load the scene file
			var settings_instance = settings_scene.instantiate() # Create an instance of the scene
			add_sibling(settings_instance)
		elif option == "quit":
			get_tree().quit()

func _on_mouse_entered() -> void:
	modulate.a = 1

func _on_mouse_exited() -> void:
	modulate.a = DEFAULT_ALPHA
