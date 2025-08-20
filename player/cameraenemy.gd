extends Node2D

var char_sin:float = 0.0

@export var direction = 90.0
const degree_change_amount = 0.01

func _ready():
	char_sin = deg_to_rad(direction)
	$Sensor.rotation_degrees = direction - 134.9
	$Top.rotation_degrees = direction
	$Bottom.rotation_degrees = direction 
	
	$FrontMarker.rotation_degrees = direction - 90.0
	$FrontMarker/Front.rotation_degrees = -direction 
	$FrontMarker/Front.skew = deg_to_rad(direction)
	
	$BackMarker.rotation_degrees = direction + 90.0
	$BackMarker/Back.rotation_degrees = -direction - 180
	$BackMarker/Back.skew = deg_to_rad(direction)
	
	

func _process(delta:float) -> void:
	if GameState.paused == false:
		char_sin += degree_change_amount
		$Sensor.rotation += degree_change_amount
		
		$Top.rotation += degree_change_amount
		$Bottom.rotation += degree_change_amount
		
		$FrontMarker.rotation += degree_change_amount
		$FrontMarker/Front.rotation -= degree_change_amount
		$FrontMarker/Front.skew += degree_change_amount
		
		$FrontMarker.position.x = (sin(char_sin) * 3)
		$FrontMarker.position.y = (cos(char_sin) * -4) + 4
		
		$BackMarker.rotation += degree_change_amount
		$BackMarker/Back.rotation -= degree_change_amount
		$BackMarker/Back.skew += degree_change_amount
		
		$BackMarker.position.x = (sin(char_sin) * -3)
		$BackMarker.position.y = (cos(char_sin) * 4) + 4
	
func _on_sensor_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if GameState.room_timer < 60:
			char_sin = 0
			$Sensor.rotation_degrees = -134.9
			$Top.rotation_degrees = 0
			$Bottom.rotation_degrees = 0 
			
			$FrontMarker.rotation_degrees = -90.0
			$FrontMarker/Front.rotation_degrees = 0 
			$FrontMarker/Front.skew = 0
		
			$BackMarker.rotation_degrees = 90.0
			$BackMarker/Back.rotation_degrees = 0 
			$BackMarker/Back.skew = 0
		
		GameState.player_detect_amount += 1


func _on_sensor_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("Player"):
		GameState.player_detect_amount -= 1
