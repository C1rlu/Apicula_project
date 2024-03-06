extends Node


@export var scanner_tool : tool_data
@onready var area = $"../ZoneCollide"

var photo_data_node 

func _ready():
	scanner_tool.tool_active_signal.connect(_scann_element)
	
func _scann_element(condition : bool):
	
	if !condition:
		if photo_data_node:
			photo_data_node.scanning(false)	
			photo_data_node = null
		return
		
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
		
		photo_data_node = areas.get_node_or_null("Photo_data")
		if  photo_data_node:
			var photo_data_rs : PhotoData = photo_data_node.get_PhotoData()
			_global_datas.selected_photoData = photo_data_rs
			
			photo_data_node.scanning(true)
			
			#_global_datas.show_on_scanner.emit(true)
			#_global_datas._photo_flash.emit()
			#_global_datas._show_object_legend.emit(true, photo_data_rs.legend)
			return
	
			
	
