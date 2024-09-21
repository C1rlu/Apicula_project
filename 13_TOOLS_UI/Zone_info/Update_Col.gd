@tool 
extends Node

@export var path : Path3D
@export var col : CollisionPolygon3D


func _ready():
	_set_collider()

func _run():
	_set_collider()

func _set_collider():
	
	
	var curve = path.curve
	var points = PackedVector2Array()
	
	for i in range(curve.get_point_count()):
		var point = curve.get_point_position(i)
		var point_2d = Vector2(point.x, point.z)  
		points.append(point_2d)
	
	col.polygon.clear()
	col.polygon = points

	
