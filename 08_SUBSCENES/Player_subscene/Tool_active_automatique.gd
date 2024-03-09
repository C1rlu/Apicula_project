extends Node
@onready var area = $"../../../ZoneCollide"

@export var light_tool_data : tool_data
@export var scanner_tool_data : tool_data
@export var magnet_tool : tool_data

@onready var timer = $Timer

func _ready():
	_global_datas._go_Subscene.connect(_start_checker)
	_global_datas._backFrom_subscene.connect(_stop_checker)
	
	
func _input(event):
	
	if _global_datas.Player_InSubScene:
		if event.is_action_pressed("Click"):
			_checker()
		
		
		
func _start_checker():
	timer.start()	
	
func _stop_checker():
	timer.stop()
	
	
func _checker():
	
	var overlap_areas_ = area.get_overlapping_areas()

	_global_datas.switching_tool.emit(light_tool_data)
	
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
	
	
func _on_timer_timeout():
	pass
	#_checker()	

