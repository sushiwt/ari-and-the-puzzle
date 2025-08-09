extends Node2D

@export var direction = 90.0

func _ready():
	$DrawnCamera.char_sin = deg_to_rad(direction)
	$Sensor.rotation_degrees = direction - 134.9
	$Top.rotation_degrees = direction
	$Bottom.rotation_degrees = direction 
	
	$FrontMarker.rotation_degrees = direction - 90.0
	$FrontMarker/Front.rotation_degrees = -direction 
	$FrontMarker/Front.skew = deg_to_rad(direction)
	

func _process(delta:float) -> void:
	$Sensor.rotation += 0.01
	
	$Top.rotation += 0.01
	$Bottom.rotation += 0.01
	
	$FrontMarker.rotation += 0.01
	$FrontMarker/Front.rotation -= 0.01
	$FrontMarker/Front.skew += 0.01
	
	$FrontMarker.position.x = (sin($DrawnCamera.char_sin) * 3)
	$FrontMarker.position.y = (cos($DrawnCamera.char_sin) * -4) + 4
	
func _on_sensor_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if GameState.room_timer < 60:
			$DrawnCamera.char_sin = 0
			$Sensor.rotation_degrees = -134.9
			$Top.rotation_degrees = 0
			$Bottom.rotation_degrees = 0 
			
			$FrontMarker.rotation_degrees = -90.0
			$FrontMarker/Front.rotation_degrees = 0 
			$FrontMarker/Front.skew = 0
		
		GameState.player_detect_amount += 1


func _on_sensor_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("Player"):
		GameState.player_detect_amount -= 1
