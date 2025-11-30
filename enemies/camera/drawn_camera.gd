extends Node2D

var char_sin:float = 0.0

var width = 16
var height = 16
var length = Vector2(0,8)
var point1 = Vector2.ZERO
var point2 = Vector2.ZERO
var point3 = Vector2.ZERO
var point4 = Vector2.ZERO

var edge_color = Color("#2F2F2F")
var solid_color = Color("#847e87")
var front_texture = load("res://enemies/camera/sprite/front.png")
var polygon_color = PackedColorArray([solid_color, solid_color, solid_color, solid_color])
var polygon_uv =  PackedVector2Array([Vector2(1,1), Vector2(1,0), Vector2(0,0), Vector2(0,1)])

func _process(_delta:float) -> void:
	
	point1 = Vector2((cos(char_sin + (PI / 3)) * width), (sin(char_sin + ((1 * PI) / 3)) * height))
	point2 = Vector2((cos(char_sin + ((5 * PI) / 3)) * width), (sin(char_sin + ((5 * PI) / 3))  * height))
	point3 = Vector2((cos(char_sin + ((4 * PI) / 3)) * width), (sin(char_sin + ((4 * PI) / 3)) * height))
	point4 = Vector2((cos(char_sin + ((2 * PI) / 3)) * width), (sin(char_sin + ((2 * PI) / 3)) * height))
	
	queue_redraw()
	
func _draw() -> void:
	#var back_polygon =  PackedVector2Array([point4, point1, point1 + length, point4 + length])
	#var right_polygon =  PackedVector2Array([point1, point2, point2 + length, point1 + length])
	#var front_polygon =  PackedVector2Array([point2, point3, point3 + length, point2 + length])
	#var left_polygon =  PackedVector2Array([point3, point4, point4 + length, point3 + length])
	#var top_polygon = PackedVector2Array([point1, point2, point3, point4])
	#var bottom_polygon = PackedVector2Array([point1 + length, point2 + length, point3 + length, point4 + length])
	#
	## Bottom Side Polygon
	#draw_polygon(bottom_polygon, polygon_color)
	#
	## Side Polygons
	#draw_polygon(front_polygon, polygon_color, polygon_uv, front_texture)
	#draw_polygon(left_polygon, polygon_color)
	#draw_polygon(back_polygon, polygon_color)
	#draw_polygon(right_polygon, polygon_color)
	#
	## Bottom Side
	#if point1 < point2:
		#draw_line(point1 + length, point2 + length, edge_color)
	#if point2 < point3:
		#draw_line(point2 + length, point3 + length, edge_color)
	#if point3 < point4:
		#draw_line(point3 + length, point4 + length, edge_color)
	#if point4 < point1:
		#draw_line(point4 + length, point1 + length, edge_color)
	##
	draw_line(point1, point1 + length, edge_color)
	#draw_line(point2, point2 + length, edge_color)
	#draw_line(point3, point3 + length, edge_color)
	draw_line(point4, point4 + length, edge_color)
	
	# Top Side
	#draw_line(point1, point2, edge_color)
	#draw_line(point2, point3, edge_color)
	#draw_line(point3, point4, edge_color)
	#draw_line(point4, point1, edge_color)


	# Top Side Polygon
	#draw_polygon(top_polygon, polygon_color)
