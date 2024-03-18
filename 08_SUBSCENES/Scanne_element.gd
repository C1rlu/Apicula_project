extends Node


@export var scanner_tool : tool_data
@onready var area = $"../ZoneCollide"


var photo_list : Array
var photo_data_node 
var previous_node
@onready var time_checker = $time_checker

func _ready():
	scanner_tool.tool_active_signal.connect(_scann_element)
	
func check_scanning(condition : bool):

	_scann_element(condition)
		
	
	
func _scann_element(condition : bool):
	
	time_checker.start()
	
	if !condition:
		if photo_data_node:
			photo_data_node.scanning(false)	
		photo_list.clear()
		time_checker.stop()
		return
		
	photo_list.clear()	
	
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
		var photo_node = areas.get_node_or_null("Photo_data")
		if  photo_node :
			photo_node.scanning(false)
			photo_list.append(photo_node)	
	
	
	var closet_photo = _closest_element(photo_list)
	photo_data_node = closet_photo 
	
	if closet_photo:
		closet_photo.scanning(true)
			
		var photo_data_rs : PhotoData = closet_photo.get_PhotoData()
		_global_datas.selected_photoData = photo_data_rs

	
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
	_scann_element(true)	
	
	
