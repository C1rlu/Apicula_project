extends Node

const BASE_ORBE_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"


func _ready():
	_global_datas._instance_orbe.connect(_instance_at_pos)
	_global_datas.instance_mirror_at_pos.connect(_instance_mirror_at_pos)
	
func _instance_at_pos():
	
	var player_position = _global_datas.subbscene_playerPosition
	
	var orbe = BASE_ORBE_PREFABS.instantiate()
	orbe.position  =  player_position
	load_scene.add_child(orbe)
	_global_datas._orbe_list.append(orbe)

func _instance_mirror_at_pos(data : orbe_data):
	
	#var player_position = _global_datas.subbscene_playerPosition
	
	var instance_position = calculate_instance_position(_global_datas._orbe_list)
	
	var mirror = data.Orbe_Result_prefabs.instantiate()
	mirror.position  =  instance_position
	load_scene.add_child(mirror)
	_global_datas._orbe_instancer_center = instance_position  

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
