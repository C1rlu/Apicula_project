extends Node


@export var magnet_tool : tool_data
@onready var area = $"../ZoneCollide"


var Magnet_node_list : Array

func _ready():
	magnet_tool.tool_active_signal.connect(_magnet_element)
	
func _magnet_element(condition : bool):
	
	if !condition:
		if Magnet_node_list.size() == 0:
			return
		for m in Magnet_node_list:
			if m == null:
				return
			m._magnet_me(false)	
			
		Magnet_node_list.clear()	
		return
		
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:

		var Magnet_node = areas.get_node_or_null("Magnet")
		if  Magnet_node:
			Magnet_node._magnet_me(true)
			Magnet_node_list.append(Magnet_node)
		
