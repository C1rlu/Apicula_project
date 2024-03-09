extends Node


@export var magnet_tool : tool_data
@onready var area = $"../ZoneCollide"


var Magnet_node_list : Array

func _ready():
	magnet_tool.tool_active_signal.connect(_magnet_element)
	
func _magnet_element(condition : bool):
	

	Magnet_node_list.clear()	
		
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:

		var Magnet_node = areas.get_node_or_null("Magnet")
		if  Magnet_node:
			Magnet_node._magnet_me(true)
			Magnet_node_list.append(Magnet_node)
		
	if Magnet_node_list.size() == 0:
		return
		
	if !condition:
		for m in Magnet_node_list:
			m._magnet_me(false)	
			
