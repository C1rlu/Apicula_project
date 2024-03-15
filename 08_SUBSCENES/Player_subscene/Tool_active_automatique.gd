extends Node
@onready var collide = $"../../../ZoneCollide"

@export var light_tool_data : tool_data
@export var scanner_tool_data : tool_data
@export var magnet_tool : tool_data

func _checker():
	
	var overlap_areas_ = collide.get_overlapping_areas()

	_global_datas.switching_tool.emit(light_tool_data)
	scanner_tool_data.tool_active_signal.emit(false)
	
	if overlap_areas_ == null:	
		return	

	for areas in overlap_areas_:
		
		_global_datas.switching_tool.emit(light_tool_data)
		
		var teleporter_node = areas.get_node_or_null("Take_teleporter")
			  
		if teleporter_node:
			if _global_datas.Player_InMirrorScene:
				return
			_global_datas.switching_tool.emit(magnet_tool)
			return	
			
		var photo_data_node = areas.get_node_or_null("Photo_data")	
				
		if photo_data_node:
			_global_datas.switching_tool.emit(scanner_tool_data)
			return	
		
	

func _on_zone_collide_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	_checker()	
	

func _on_zone_collide_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	_checker()
	
