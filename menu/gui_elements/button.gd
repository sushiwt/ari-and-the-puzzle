extends Area2D

@export var option = "play"

const DEFAULT_ALPHA = 0.75
var original_position = Vector2.ZERO
#var bank = preload("res://locations/bank/bank.tscn")
var loading = preload("res://menu/loading.tscn")

var timer = 0
@export var animation_offset = -64
@export var animation_delay = 0

func _ready() -> void:
	modulate.a = DEFAULT_ALPHA
	original_position = position
	position.x += animation_offset
	
	if option == "quit" && OS.has_feature("web"):
		$Quit.texture = preload("res://menu/sprite/more.png") 
	

func _process(delta:float) -> void:
	if timer > animation_delay:
		position = position.lerp(original_position, 0.1)
	
	if original_position != position:
		timer += 1
		

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("confirm"):
		print("You pressed it!")
		
		if option == "play":
			GameState.puzzle_requirement = 4
			GameState.room = 0
			GameState.score = 0
			
			if OS.has_feature("web"):
				get_tree().change_scene_to_file("res://menu/loading.tscn")
			else:
				var loading_instance = loading.instantiate()
				get_parent().add_child(loading_instance)
			
			
		if option == "menu":
			get_tree().change_scene_to_file("res://menu.tscn")
		elif option == "settings":
			var settings_scene = preload("res://menu/panels/settings.tscn") # Load the scene file
			var settings_instance = settings_scene.instantiate() # Create an instance of the scene
			get_parent().add_sibling(settings_instance)
		elif option == "quit":
			if OS.has_feature("web"):
				OS.shell_open("https://sushiwt.itch.io")
			else:
				get_tree().quit()
		elif option == "credits":
			var credits_scene = preload("res://menu/panels/credits.tscn") # Load the scene file
			var credits_instance = credits_scene.instantiate() # Create an instance of the scene
			add_sibling(credits_instance)
			

func _on_mouse_entered() -> void:
	modulate.a = 1

func _on_mouse_exited() -> void:
	modulate.a = DEFAULT_ALPHA
