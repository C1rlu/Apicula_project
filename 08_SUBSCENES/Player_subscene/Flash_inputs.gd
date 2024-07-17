extends Node

@onready var timer = $Timer
@export var flash_tool_data : tool_data
@onready var area = $"../ZoneCollide"

func _ready():
	flash_tool_data.tool_active_signal.connect(_start_light)	


func _start_light(condition):
	
	if _global_datas.in_scanner_mode:
		return
	
	if !condition:
		return
			
	if !timer.is_stopped():
		return	
	timer.start()
	
	_global_datas._scan_mirror_xray.emit()
	_global_datas._photo_flash.emit()
	#check_flash_zone()
		
	
func check_flash_zone():
	
	var all_area = area.get_overlapping_areas()
	
	if all_area:
		for areas in all_area:
			
			
			var vortex = areas.get_node_or_null("Teleport_zone")
			if vortex:
				vortex._teleport()
			
			var vortex_back = areas.get_node_or_null("Teleport_zone_back")
			if vortex_back:
				vortex_back._teleport()	
			
			
			
			
			
			
