extends Node


@onready var area = $"../ZoneCollide"
@onready var timer = $Timer
@export var flash_tool_data : tool_data

			
func _ready():
	flash_tool_data.tool_active_signal.connect(check_area)	
	
func check_area(condition : bool):
	
	if _global_datas.in_scanner_mode:
		return
		
	if !condition:
		return
	if !timer.is_stopped():
		return	
		
	timer.start()
	_global_datas._take_photo.emit()
	_global_datas._photo_flash.emit()

	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
		
		var loot_data_node = areas.get_node_or_null("Lootable")
		var mirror_node = areas.get_node_or_null("Mirror")
		var mirror_destination = areas.get_node_or_null("Mirror_destination")
	
		if  loot_data_node:
			var lootable_data_rs : Loot_Data = loot_data_node.get_lootable()
			_global_datas._find_loot.emit(lootable_data_rs)	

			return
		
		if mirror_destination:
			if _global_datas.Player_InMirrorScene:
				var desination = mirror_destination.destination
				if desination:
					_global_datas._load_mirror_subscene.emit(desination)
					return
	
		if mirror_node:
			if !_global_datas.Player_InMirrorScene:		
				_global_datas._mirror_switch.emit(true)
			#else:
				#_global_datas._mirror_switch.emit(false)	

			
func _on_timer_timeout():
	timer.stop()
