extends Node

const BASE_ORBE_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"


@export var show_stroke_id_debug = false


func _ready():
	
	_global_datas._instance_stroke.connect(_instance_at_pos)


func _instance_at_pos():
	
	var target = _global_datas._orbe_tool_origin_position
				
	var orbe = BASE_ORBE_PREFABS.instantiate()
	orbe.position  = target 
	load_scene.add_child(orbe)
	_global_datas._orbe_stroke_scene.append(orbe)

	# add the actual points in the stroke list
	var StrokeID = _global_datas._strokeID
	var newPoints = Points.Point.new(target.x * 100,target.y*100,StrokeID)
	_global_datas._orbe_stroke.append(newPoints)
	
	if show_stroke_id_debug:
		var string = "Points.Point.new("+str(newPoints.X)+","+str(newPoints.Y)+","+str(newPoints.StrokeID)+"),"
		print(string)

func calculate_instance_position(points: Array):
	
	var sum_x = 0
	var sum_y = 0
	var sum_z = 0
	# Summing up all the x, y, and z coordinates
	for point in points:
		sum_x += point.position.x
		sum_y += point.position.y
		sum_z += point.position.z

	# Calculating the average
	var avg_x = sum_x / points.size()
	var avg_y = sum_y / points.size()
	var avg_z = sum_z / points.size()

	return Vector3(avg_x, avg_y, avg_z)
	
