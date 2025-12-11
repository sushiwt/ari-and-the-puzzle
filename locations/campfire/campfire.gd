extends Node2D

var end_of_demo = preload("res://basegame/demo/end_of_demo.tscn")
var glitch_effect_check = false
var glitch_effect_timer = 0

var viewport_image: Image
var texture = ImageTexture.new()

func _ready() -> void:
	# TODO find a better deletion state
	GameState.score -= GameState.puzzles_collected * 100
	
	if GameState.puzzles_collected == GameState.puzzle_requirement:
		GameState.score -= 100

func _process(_delta:float) -> void:
	if $Player.position.y <= 0 or glitch_effect_timer >= 120:
		get_tree().change_scene_to_packed(end_of_demo)
	
	if glitch_effect_check:
		glitch_effect_timer += 1
		$AudioStreamPlayer.play()
		
		if glitch_effect_timer <= 60:
			var texturerect = TextureRect.new()
			texturerect.texture = ImageTexture.create_from_image(viewport_image)
			texturerect.global_position = Vector2(glitch_effect_timer * 2 , $Player/Camera2D.global_position.y + glitch_effect_timer * 2 - 120)
			add_child(texturerect)

func glitch_effect():
	viewport_image = get_viewport().get_texture().get_image()
	$Player/TouchControls.visible = false
	glitch_effect_check = true
