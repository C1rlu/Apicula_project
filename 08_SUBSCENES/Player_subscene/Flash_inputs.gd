extends Node


@onready var area = $"../ZoneCollide"
@onready var timer = $Timer
@onready var timer_process = $Timer_process

@export var flash_tool_data : tool_data

var active_fusion_node
func _ready():
	flash_tool_data.tool_active_signal.connect(check_area)	
	flash_tool_data.tool_active_signal.connect(_check_area_process)	
		
func _check_area_process(condition):
	
	if condition:
		timer_process.start()			
	else:
		
		timer_process.stop()
		if active_fusion_node != null:
			active_fusion_node._fusion(false)
			active_fusion_node = null			
			
			
func check_area(condition : bool):
	
	#if _global_datas.player_is_Interactive_Zone:
		#return
		
	if _global_datas.in_scanner_mode:
		return
	if !condition:
		return
	if !timer.is_stopped():
		return	
		

	timer.start()
	_global_datas._scan_mirror_xray.emit()
	_global_datas._photo_flash.emit()

	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
	
		var mirror_node = areas.get_node_or_null("Mirror")
		var mirror_destination = areas.get_node_or_null("Mirror_destination")
		var Movable_oddity = areas.get_node_or_null("Movable_oddity")
	
		if mirror_destination:
			if _global_datas.Player_InMirrorScene:
				var desination = mirror_destination.destination
				if desination:
					_global_datas._load_mirror_subscene.emit(desination)
					return
	
		if mirror_node:
			if !_global_datas.Player_InMirrorScene:		
				_global_datas._mirror_switch.emit(true)
			else:
				_global_datas._mirror_switch.emit(false)	
	
		if Movable_oddity:
			Movable_oddity.move_oddity()
			
func check_process():

		
	if _global_datas.in_scanner_mode:
		return
	var overlap_areas_ = area.get_overlapping_areas()
	
	#if overlap_areas_ == null:
		#return
		
	for areas in overlap_areas_:
	
		var fusion_node = areas.get_node_or_null("Fusion")
		if fusion_node:
			active_fusion_node = fusion_node
			fusion_node._fusion(true)
			return
				
	if active_fusion_node != null:
				active_fusion_node._fusion(false)
				active_fusion_node = null		
					
func _on_timer_timeout():
	timer.stop()


func _on_timer_process_timeout():
	check_process()
