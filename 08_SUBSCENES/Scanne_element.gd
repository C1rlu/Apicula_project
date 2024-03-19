extends Node

@export var scanner_tool : tool_data
@onready var time_checker = $time_checker
@onready var zone_collide = $"../ZoneCollide"


func _ready():
	scanner_tool.tool_active_signal.connect(check_scanning)
	
func check_scanning(condition : bool):
	
	if !condition:
		time_checker.stop()
		disable_all_scanning()
		return
		
	time_checker.start()
	
	var closet_photo = _closest_element(_global_datas._photo_data_scene_list)
	var overlap_areas = zone_collide.get_overlapping_areas()
	if overlap_areas == null:
		return
		
	for area in overlap_areas:
		var photo_data_node = area.get_node_or_null("Photo_data")	 
		if photo_data_node:
			if photo_data_node == closet_photo:
				if !closet_photo.is_scanning:
					_scanning_this(closet_photo)

					

func _closest_element(array):
	
	var closest_node = null
	var closest_node_distance = 0.0
	for element in array:
		var player_sub = _global_datas.subbscene_playerPosition
		var current_node_distance = player_sub.distance_to(element.get_node_position())
		if closest_node == null or current_node_distance < closest_node_distance:
			closest_node = element
			closest_node_distance = current_node_distance
			
	return closest_node

func _on_time_checker_timeout():
	
	time_checker.start()
	check_scanning(true)
	
	
func _scanning_this(node):
	
	for e in _global_datas._photo_data_scene_list:
		e.stop_scanning()
				
	node.scanning()
	
func disable_all_scanning():
	
	for e in _global_datas._photo_data_scene_list:
		e.stop_scanning()	
