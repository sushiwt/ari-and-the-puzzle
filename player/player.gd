extends CharacterBody2D

const WALK_SPEED = 100.0
const RUN_SPEED = 200.0

var mvmt_vector: Vector2
var use_spd

var player_state = "idle"
var player_direction = "Down"

var pause = preload("res://player/pause.tscn")

@onready var talkable_finder: Area2D = $Direction/TalkableFinder
var gui_exists = false
var rot_map = {
	Vector2(-1, 0): PI/2,
	Vector2(1, 0): (3*PI)/2,
	Vector2(0, -1): PI,
	Vector2(0, 1): 0
}

func _ready() -> void:
	$TouchControls.visible = false
	if OS.has_feature("web_android") || OS.has_feature("web_ios"):
		$TouchControls.visible = true

func _process(_delta:float) -> void:
	if Input.is_action_just_pressed("pause") && !gui_exists:
		var pause_instance = pause.instantiate()
		add_sibling(pause_instance)
	
	if Input.is_action_just_pressed("dialogue_confirm") && !gui_exists:
		var talkables = talkable_finder.get_overlapping_areas()
		if talkables.size() > 0:
			talkables[0].action()
			return
			
	GameState.paused = gui_exists
	
	gui_exists = true if get_tree().get_nodes_in_group("Dialogue").size() > 0 else false
	
	use_spd = WALK_SPEED
	mvmt_vector = Vector2.ZERO
	player_state = "idle"
	
	if Settings.slide_on_walls:
		if is_on_ceiling() || is_on_floor() || is_on_wall():
			use_spd = RUN_SPEED
	
	if !gui_exists:
		if Input.is_action_pressed("ui_left"):
			mvmt_vector.x = -1
			player_direction = "Left"
		if Input.is_action_pressed("ui_right"):
			mvmt_vector.x = 1
			player_direction = "Right"
		if Input.is_action_pressed("ui_up"):
			mvmt_vector.y = -1
			player_direction = "Up"
		if Input.is_action_pressed("ui_down"):
			mvmt_vector.y = 1
			player_direction = "Down"
	
	#if is_on_wall() || is_on_floor() || is_on_ceiling():
		#use_spd = RUN_SPEED
	
	velocity = mvmt_vector * use_spd 
	
	move_and_slide()
	
	if velocity != Vector2.ZERO:
		player_state = "run"
	
	$PlayerSprite.play(player_state + player_direction)
	$Direction.rotation = rot_map.get(mvmt_vector, $Direction.rotation)
	
	
