extends CharacterBody2D

const WALK_SPEED = 100.0
const RUN_SPEED = 200.0

var mvmt_vector: Vector2
var use_spd

var player_state = "idle"
var player_direction = "Down"

func _process(delta: float) -> void:
	use_spd = WALK_SPEED
	mvmt_vector = Vector2.ZERO
	player_state = "idle"
	
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
	
