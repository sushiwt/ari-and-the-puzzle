extends Node2D

var char_sin:float = 0.0

@export var direction = 90.0
const degree_change_amount = 0.01

var seeing_player = false
var saw_player = false

var see_player_timer = 0
var added_score = 0
var noted_score = 0

var so_close_node = preload("res://enemies/camera/effect/so_close.tscn")

func _ready():
	char_sin = deg_to_rad(direction)
	$Sensor.rotation_degrees = direction - 134.9
	$Top.rotation_degrees = direction
	
	$FrontMarker/Front.skew = deg_to_rad(direction)
	$BackMarker/Back.skew = deg_to_rad(direction)
	$LeftMarker/Left.skew = deg_to_rad(direction - 90)
	$RightMarker/Right.skew = deg_to_rad(direction - 90)
	

func _process(_delta:float) -> void:
	if GameState.paused == false:
		char_sin += degree_change_amount
		$Sensor.rotation += degree_change_amount
		$Top.rotation += degree_change_amount
		
		$FrontMarker/Front.skew += degree_change_amount
		$FrontMarker.position.x = (sin(char_sin) * 14)
		$FrontMarker.position.y = (cos(char_sin) * -14)
		
		$BackMarker/Back.skew += degree_change_amount
		$BackMarker.position.x = (sin(char_sin) * -14)
		$BackMarker.position.y = (cos(char_sin) * 14) 
		
		$LeftMarker/Left.skew += degree_change_amount
		$LeftMarker.position.x = (cos(char_sin) * 8)
		$LeftMarker.position.y = (sin(char_sin) * 8)
		
		$RightMarker/Right.skew += degree_change_amount
		$RightMarker.position.x = (cos(char_sin) * -8)
		$RightMarker.position.y = (sin(char_sin) * -8)
		
		if !saw_player and seeing_player:
			see_player_timer += 1
		
		if see_player_timer > 16:
			added_score += 10
			noted_score = added_score
		
		if saw_player:
			GameState.score += added_score
			added_score = 0
	
func _on_sensor_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Camera Checker"):
		if GameState.room_timer < 60:
			position.x = randi_range(32, 288)
			position.y = randi_range(48, 208)
			print("camera position.changed..")
			
			char_sin = 0
			$Sensor.rotation_degrees = -134.9
			$Top.rotation_degrees = 0
			
			$FrontMarker/Front.skew = 0
			$BackMarker/Back.skew = 0
			$LeftMarker/Left.skew = deg_to_rad(-90)
			$RightMarker/Right.skew = deg_to_rad(-90)
			
	if area.is_in_group("Player"):
		seeing_player = true
		GameState.player_detect_amount += 1


func _on_sensor_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("Player"):
		GameState.player_detect_amount -= 1
		
		if !saw_player and see_player_timer > 16:
			var so_close_instance = so_close_node.instantiate()
			so_close_instance.global_position = area.global_position
			so_close_instance.score = added_score
			add_sibling(so_close_instance)
		
		saw_player = true
		see_player_timer = 0


func _on_shadow_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Obstacle"):
		$Shadow.z_index = -2
