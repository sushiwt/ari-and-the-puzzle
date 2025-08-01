@tool
extends StaticBody2D

@export var computer_visible = false
@export var paper_visible = false
@export var table_width = 4
@export var table_height = 2

func _process(delta:float) -> void:
	#$LightOccluder2D.occluder.polygon = PackedVector2Array([Vector2(0,-16), 
															#Vector2(table_width * 16, -16),
															#Vector2(table_width * 16, (table_height * 16) - 14),
															#Vector2((table_width * 16) - 2, (table_height * 16) - 14),
															#Vector2((table_width * 16) - 2, (table_height * 16)), 
															#Vector2((table_width * 16) - 6, (table_height * 16)),
															#Vector2((table_width * 16) - 6, (table_height * 16) - 9),
															#Vector2((table_width * 16) - 11, (table_height * 16) - 14),
															#Vector2(11, (table_height * 16) - 14),
															#Vector2(6, (table_height * 16) - 9),
															#Vector2(6, table_height * 16),
															#Vector2(2, table_height * 16),
															#Vector2(2, (table_height * 16) - 14),
															#Vector2(0, (table_height * 16) - 14)])
	
	
	if computer_visible:
		$Computer.visible = true
		$ComputerBack.visible = true
	else:
		$Computer.visible = false
		$ComputerBack.visible = false
		
	if paper_visible:
		$Paper.visible = true
		$Paper2.visible = true
	else:
		$Paper.visible = false
		$Paper2.visible = false
	
	$NinePatchRect.size.x = (table_width * 16)
	$NinePatchRect.size.y = (table_height * 16) + 16
	$CollisionShape2D.position.x = (table_width * 8) 
	$CollisionShape2D.position.y = (table_height * 8)
	$CollisionShape2D.scale.x = (table_width * 8) / 32.0
	$CollisionShape2D.scale.y = (table_height * 8) / 16.0
	
	$TableOccluder.scale.x = (table_width * 8) / 32.0
	$TableOccluder.scale.y = (table_height * 8) / 16.0
	$TableEdgeOccluder.position.y = (table_height * 16) - 16
	$TableEdgeOccluder.scale.x = (table_width * 8) / 32.0
	
	
	$LeftLegOccluder.position = Vector2(2, (table_height * 16) - 14)
	$RightLegOccluder.position = Vector2((table_width * 16) - 2, (table_height * 16) - 14)
