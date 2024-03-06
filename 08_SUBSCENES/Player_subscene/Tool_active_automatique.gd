extends Node

@export var light_tool_data : tool_data
@export var scanner_tool_data : tool_data

func _on_zone_collide_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if !area:
		return
		
	var photo_data_node = area.get_node_or_null("Photo_data")			
	if photo_data_node:
		_global_datas.switching_tool.emit(scanner_tool_data)	
		
		
func _on_zone_collide_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if !area:
		return
		
	var photo_data_node = area.get_node_or_null("Photo_data")			
	if photo_data_node:
		_global_datas.switching_tool.emit(light_tool_data)	
