extends Node

@onready var player_sub = $"../Player_Sub"


func _ready():
	
	_global_datas._teleport_at_position.connect(_teleport_player)
	
	
func _teleport_player():
	
	if _global_datas._teleporter_list.size() == 0:
		return
		
	var closest_teleporter = _closest_element(_global_datas._teleporter_list)
	player_sub.linear_velocity = Vector3.ZERO
	player_sub.position = closest_teleporter.teleporter_position
	closest_teleporter._remove_teleporter()
	
func _closest_element(array):
	
	var closest_node = null
	var closest_node_distance = 0.0
	for element in array:

		var current_node_distance = player_sub.position.distance_to(element.teleporter_position)
		if closest_node == null or current_node_distance < closest_node_distance:
			closest_node = element
			closest_node_distance = current_node_distance

	return closest_node
